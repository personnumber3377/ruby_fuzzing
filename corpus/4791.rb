do |th|
          assert_same(th, th.join(2), bug13076)
        end