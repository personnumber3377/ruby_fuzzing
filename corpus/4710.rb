do |f|
        assert_nothing_raised(feature7103) {
          f.reopen(t.path, "r", binmode: true)
        }
        assert_equal("foo\n", f.gets)
      end