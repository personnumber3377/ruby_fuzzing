do |x|
      range = 0...x
      3.times do
        assert_include(range, r.rand(x), "rand(#{x})")
      end