do |method|
      assert_raise(ArgumentError){ [].lazy.send