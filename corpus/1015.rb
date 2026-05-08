do |k|
      k = {x: k}
      assert_same(obj, h2[k], ->{k.inspect})
    end