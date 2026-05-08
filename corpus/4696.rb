do |f|
        assert_raise(ArgumentError) { f.sysread(-1) }
      end