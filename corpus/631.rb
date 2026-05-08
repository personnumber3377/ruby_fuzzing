do |e, a|
      na = [e, a] + args
      assert_equal(*na)
      na = [e.class, a] + args
      assert_instance_of(*na)
    end