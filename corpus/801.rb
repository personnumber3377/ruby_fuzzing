document"],
     [:&, "argument prefix"],
     [:+, "unary operator"],
     [:-, "unary operator"],
     [:/, "regexp literal"],
     [:%, "string literal"],
    ].each do |op, syn|
      all_assertions do |a|
        ["puts 1 #{op}0", "puts :a #{op}0", "m = 1; puts m #{op}0"].each do |src|
          a.for(src) do
            warning = /'#{Regexp.escape(op)}' after local variable or literal is interpreted as binary operator.+?even though it seems like #{syn}/m

            assert_warning(warning, src) do
              assert_valid_syntax(src, "test", verbose: true)
            end