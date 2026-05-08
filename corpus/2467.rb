dom.new(0)
    rnd2 = Random.new(0)
    nums.each do |m, k, x|
      assert_same_numbers(m.class, Random.rand(m), rnd.rand(m), rnd2.rand(m))
    end