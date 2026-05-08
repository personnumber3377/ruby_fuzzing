do
      [{a: 0, b: 1}, C.new({a: 0, b: 1})].all? do |i|
        case i
        in a:, **nil
          assert_equal(0, a)
        else
          true
        end