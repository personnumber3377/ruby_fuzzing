do |f|
        f.sysseek(-4, IO::SEEK_END)
        assert_equal("baz\n", f.read)
      end