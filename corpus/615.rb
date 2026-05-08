do |n|
      assert_raise(ArgumentError, n += z + "A") {Float(n)}
      assert_raise(ArgumentError, n += z + ".0") {Float(n)}
    end