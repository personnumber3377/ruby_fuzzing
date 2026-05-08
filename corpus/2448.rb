do |rnd|
        r=rnd.rand(i..(m+i-1))
        assert_equal(w+i, r)
      end