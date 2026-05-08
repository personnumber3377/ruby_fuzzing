do |n|
      100.times do
        b = a.sample(n)
        assert_equal([n, 18].min, b.size)
        assert_equal(a, (a | b).sort)
        assert_equal(b.sort, (a & b).sort)
      end