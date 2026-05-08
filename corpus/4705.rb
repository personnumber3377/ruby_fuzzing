do |f|
        f.gets
        assert_nothing_raised {
          f.reopen(t.path)
          assert_equal("foo\n", f.gets)
        }
      end