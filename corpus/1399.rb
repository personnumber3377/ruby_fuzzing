do
      case C.new({a: 0, b: 0, c: 0})
      in {a: 0, b:, **r}
        assert_equal(0, b)
        assert_equal({c: 0}, r)
        C.keys == nil
      end