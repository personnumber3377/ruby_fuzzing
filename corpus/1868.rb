do |c|
      e = Errno.const_get(c)
      assert_operator e, :<, SystemCallError, proc {e.ancestors.inspect}
    end