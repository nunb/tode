as yet unclassified
findClass: findTokens
  "find class <pattern>"

  | regex |
  regex := self findRegex: findTokens.
  ^ SystemNavigation default allClasses asArray select: [ :cls | regex search: cls name asString ]