do
        v = Class.new
        v::C ||= raise bug rescue 1
        assert_equal(1, v::C)
      end