do
      case C.new({a: 0, b: 0, c: 0})
      in {**r}
        assert_equal({a: 0, b: 0, c: 0}, r)
        C.keys == nil
      end