dom.new(-1).rand
    assert_not_equal(rand_1, Random.new((1 << 31) -1).rand, "#{bug3104} (2)")
    assert_not_equal(rand_1, Random.new((1 << 63) -1).rand, "#{bug3104} (2)")

    [-1, -2**10, -2**40].each {|n|
      b = (2**64).coerce(n)[0]
      r1 = Random.new(n).rand
      r2 = Random.new(b).rand
      assert_equal(r1, r2)
    }
  end