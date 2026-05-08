do |name, num|
      assert_equal(num, Signal.list[Signal.signame(num)], name)
    end