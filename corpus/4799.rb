do |f|
        assert_equal(3, f.pwrite("ooo", 4))
        assert_equal("ooo", f.pread(3, 4))
      end