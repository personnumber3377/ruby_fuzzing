dom_float
    r = Random.new(0)
    3.times do
      assert_include(0...1.0, r.rand)
    end