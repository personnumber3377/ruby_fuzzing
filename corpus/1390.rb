do
      case {a: 0, b: 1}
      in {a: 1,}
        false
      in {a:,}
        _a = a
        true
      end