do |i|
      val = (m + i).fdiv(m)
      assert_operator val, :>=, prev, "1+epsilon*(#{i}/100)"
      prev = val
    end