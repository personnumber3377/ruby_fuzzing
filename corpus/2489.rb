do |i|
      assert_not_equal(Random.new(i).rand(range), Random.new(i+guard).rand(range))
    end