do |f|
        f.sync = true
        f.read
        f.write "Hello"
        assert_equal(5, f.pos)
      end