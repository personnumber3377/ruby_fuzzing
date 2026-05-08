do
      a = rand
      b = a+rand*1000
      s = (b - a) / 10
      assert_equal(11, (a..b).step(s).to_a.length)
    end