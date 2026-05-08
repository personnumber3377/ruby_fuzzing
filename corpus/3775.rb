do |y|
      1.times do |z|
        assert_equal([:x, :y, :z], local_variables.sort)
      end