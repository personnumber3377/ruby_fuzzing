do |m|
      assert_in_out_err([], <<-INPUT, %w(:ok), %r"warning: removing '#{m}' may cause serious problems$")
        $VERBOSE = false
        begin
          Class.new.instance_eval { remove_method(:#{m}) }
        rescue NameError
          p :ok
        end