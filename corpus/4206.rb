do |(b, e), excl|
      next unless b > e || (b == e && excl)

      r = Range.new(b, e, excl)
      a = []
      r.reverse_each {|x| a << x }
      assert_equal([], a, "failed on #{r}")
    end