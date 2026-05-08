do |f|
        f.write "Hello"
        assert_equal(5, f.pos)
      end