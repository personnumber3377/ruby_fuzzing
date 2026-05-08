do |b|
      r = b..b-1
      a = []
      r.reverse_each {|x| a << x }
      assert_equal([], a, "failed on #{r}")
    end