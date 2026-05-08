do |name|
      assert_syntax_error("proc{a = #{name} }", "'#{noname[0]}' without identifiers is not allowed as #{type} variable name")
    end