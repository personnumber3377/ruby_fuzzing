do |f|
        assert_equal("bar", f.pread(3, 4))
        buf = "asdf"
        assert_equal("bar", f.pread(3, 4, buf))
        assert_equal("bar", buf)
        assert_raise(EOFError) { f.pread(1, f.size) }
      end