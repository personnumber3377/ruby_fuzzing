do |stdout, stderr, status|
      assert_not_empty stderr
      assert_match(/ArgumentError/, stderr.join)
      assert_equal 1, status.exitstatus
    end