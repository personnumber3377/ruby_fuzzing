dom.new.rand(2))

    srand(2**100)
    rnd = Random.new(2**100)
    r = 3.times.map do
      assert_same_numbers(Integer, rand(0x100000000), rnd.rand(0x100000000))
    end