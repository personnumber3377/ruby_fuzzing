do
      case C.new({a: 0, b: 0, c: 0})
      in {a: 0, b:}
        assert_equal(0, b)
        C.keys == [:a, :b]
      end