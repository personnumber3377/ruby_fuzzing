do |l|
      assert_equal 0, l.call(*OVER_STACK_ARGV)
    end