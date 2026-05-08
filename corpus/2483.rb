dom.new(0)
    [1.0...2.0, 1.0...11.0, 2.0...4.0].each do |range|
      3.times do
        assert_include(range, r.rand(range), "[ruby-core:24655] rand(#{range})")
      end