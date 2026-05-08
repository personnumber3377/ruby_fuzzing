do |f|
        assert_nothing_raised(feature7103) {
          f.reopen(t.path, autoclose: false)
        }
        assert_equal("foo\n", f.gets)
      end