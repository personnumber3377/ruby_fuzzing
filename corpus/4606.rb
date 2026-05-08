do |r|
        81.times {assert_equal(line, r.gets)}
        assert_equal("a"*99+"\n", r.gets)
      end