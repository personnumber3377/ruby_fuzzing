do |m|
      assert_in_out_err([], <<-INPUT, [], %r"warning: redefining '#{m}' may cause serious problems$")
        $VERBOSE = false
        def (Object.new).#{m}; end