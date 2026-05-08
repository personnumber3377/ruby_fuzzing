do |kwd|
      assert_syntax_error("#{kwd} = nil", /Can't .* #{kwd}$/)
      assert_equal(gvar, global_variables)
    end