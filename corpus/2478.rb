do
      assert_same_numbers(Integer, r1.rand(0x100000000), r2.rand(0x100000000))
    end