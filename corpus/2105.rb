do |mesg, c|
      c.class_eval {alias m2 m}
      o = c.new
      assert_equal(:m, o.m, mesg)
      assert_equal(:m2, o.m2, mesg)
    end