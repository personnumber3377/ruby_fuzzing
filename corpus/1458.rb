do |v|
      k = v.class.to_s
      assert_redefine_method(k, '===', "assert_equal(#{v.inspect} === 0, 0)")
      assert_performance_warning(k, '===')
    end