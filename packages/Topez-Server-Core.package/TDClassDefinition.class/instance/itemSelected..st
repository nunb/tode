as yet unclassified
itemSelected: topez
  | cl |
  cl := Smalltalk classNamed: self className.
  cl
    edit: nil
    topez: topez
    aspect: #'browse'
    windowName: nil
    windowId: nil.
  ^ nil