do |f|
        assert_nothing_raised {
          f.reopen(t.path, "r")
          assert_equal("foo\n", f.gets)
        }
      end