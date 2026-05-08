dom_dup
    r1 = Random.new(0)
    r2 = r1.dup
    3.times do
      assert_same_numbers(Integer, r1.rand(0x100000000), r2.rand(0x100000000))
    end