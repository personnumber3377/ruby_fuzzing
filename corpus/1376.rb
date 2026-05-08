do
      [{a: 0}, C.new({a: 0})].all? do |i|
        case i
        in a:, **nil
          assert_equal(0, a)
          true
        end