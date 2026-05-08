do |b|
      r = b..b
      a = []
      r.reverse_each {|x| a << x }
      assert_equal([b], a, "failed on #{r}")

      r = b...b+1
      a = []
      r.reverse_each {|x| a << x }
      assert_equal([b], a, "failed on #{r}")
    end