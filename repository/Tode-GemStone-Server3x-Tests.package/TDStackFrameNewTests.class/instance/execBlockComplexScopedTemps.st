block methods
execBlockComplexScopedTemps
  | a b |
  a := 1.
  b := 2.
  ^ [ | c |
  c := 3.
  [ a halt ] value ]