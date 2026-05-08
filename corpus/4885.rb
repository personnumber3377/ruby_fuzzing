do |n|
      assert_in_out_err([], <<-INPUT, [], %r"warning: undefining '#{n}' may cause serious problems$")
        $VERBOSE = false
        Class.new.instance_eval { undef_method(:#{n}) }
      INPUT
    end