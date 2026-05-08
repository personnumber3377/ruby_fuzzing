do
      a = rand
      b = a+rand*1000
      s = (b - a) / 10
      b = a + s*9.999999
      seq = (a...b).step(s)
      assert_equal(10, seq.to_a.length, seq.inspect)
    end