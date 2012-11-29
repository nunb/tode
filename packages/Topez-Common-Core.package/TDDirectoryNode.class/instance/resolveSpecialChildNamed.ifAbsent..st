as yet unclassified
resolveSpecialChildNamed: childName ifAbsent: absentBlock
    childName = '..'
        ifTrue: [ ^ self parent ].
    childName = '.'
        ifTrue: [ ^ self ].
    childName = '.self'
        ifTrue: [ 
            ^ (self dotSelfObject asTDObjectNode: self topez aspect: #'self')
                name: childName;
                parent: self;
                yourself ].
    childName = '.node'
        ifTrue: [ 
            ^ (self asTDObjectNode: self topez aspect: #'self')
                name: childName;
                parent: self;
                yourself ].
    childName = '.readme'
        ifTrue: [ 
            ^ (self asTDObjectNode: self topez aspect: #'self')
                name: childName;
                parent: self;
                yourself ].
    ^ absentBlock value