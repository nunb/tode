accessing
evaluateTokens: stonTokens
    | tokens commandBlock text |
    tokens := STON fromString: stonTokens.
    commandBlock := self commands
        at: (tokens at: 1)
        ifAbsent: [ ^ self error: 'Unknown command: ' , (tokens at: 1) printString ].
    text := (commandBlock value: self value: tokens value: nil) renderText.
    ^ STON toString: text