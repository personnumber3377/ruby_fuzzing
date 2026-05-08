do |n|
      assert_same_numbers(Integer, n, rand(0x100000000))
    end