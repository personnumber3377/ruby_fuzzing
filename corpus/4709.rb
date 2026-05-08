do |f|
        assert_nothing_raised(feature7067) {
          f.reopen(t.path, File::RDONLY)
          assert_equal("foo\n", f.gets)
        }
      end