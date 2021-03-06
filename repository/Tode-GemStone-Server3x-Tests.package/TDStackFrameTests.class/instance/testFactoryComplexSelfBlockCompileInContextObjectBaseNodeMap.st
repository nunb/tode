tests
testFactoryComplexSelfBlockCompileInContextObjectBaseNodeMap
  | homeMethod blockFrame baseNodeMap x y compileContext |
  compileContext := Object new.
  [ (self factoryBlockCompile: '[self halt. self]' inContext: compileContext) value ]
    on: Halt
    do: [ :ex | 
      self
        createFramesinFork: [ :frame :nodeMap | 
          blockFrame := frame.
          baseNodeMap := nodeMap ]
        exception: ex ].
  self assert: baseNodeMap size == 4.
  self assert: (baseNodeMap includesKey: '(context)').
  homeMethod := blockFrame
    objectFor: '(homeMethod)'
    ifAbsent: [ self assert: false ].
  self assert: homeMethod inClass isNil.
  self
    assert:
      (x := blockFrame objectFor: '(varContext)' ifAbsent: [ self assert: false ])
        class == VariableContext.
  self
    assert:
      (x := blockFrame objectFor: '(receiver)' ifAbsent: [ self assert: false ])
        method == (y := self factoryBlock) method.	"it's complicated"
  self assert: (blockFrame argOrTempNamed: 'self') == compileContext.
  [ 
  | blockReturn |
  blockReturn := self factoryBlock value.
  self assert: blockReturn == (blockFrame argOrTempNamed: 'self') ]
    on: Halt
    do: [ :ex | ex resume ]