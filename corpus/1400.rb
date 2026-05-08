do
      case C.new({a: 0, b: 0, c: 0})
      in {**}
        C.keys == []
      end