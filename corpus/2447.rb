do |rnd|
        r=rnd.rand(i...(m+i))
        assert_equal(w+i, r)
      end