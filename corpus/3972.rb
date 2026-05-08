do |i, o|
      assert_nil i.timeout

      i.timeout = 10
      assert_equal 10, i.timeout
      assert_nil o.timeout

      o.timeout = 20
      assert_equal 20, o.timeout
      assert_equal 10, i.timeout
    end