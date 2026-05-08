do
      case {a: 0}
      in {a: 1
      }
        false
      in {a:
            2}
        false
      in a: {b:}, c:
        _b = b
        p c
      in {a:
      }
        _a = a
        true
      end