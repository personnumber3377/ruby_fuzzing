do |o|
      assert_equal o.to_s, o.instance_eval(&:to_s)
    end