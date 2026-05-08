do |i|
      exact = 10**(i/2)
      x = 10**i
      assert_equal(exact, Integer.sqrt(x), "10**#{i}")
      assert_equal(exact, Integer.sqrt(x+1), "10**#{i}+1")
      assert_equal(exact-1, Integer.sqrt(x-1), "10**#{i}-1")
    end