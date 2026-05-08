do |i|
      i = 1 << i
      assert_infinity(Math.gamma(i), "Math.gamma(#{i}) should be INF")
      assert_infinity(Math.gamma(i-1), "Math.gamma(#{i-1}) should be INF")
    end