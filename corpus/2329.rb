do |y|
      [-1, 0, 1].each do |x|
        z1 = x**y
        z2 = (-x)**y
        if y % 2 == 1
          assert_equal(z2, -z1)
        else
          assert_equal(z2, z1)
        end