do |name|
      assert_syntax_error("proc {a = #{name} }", "'#{name}' is not allowed as #{type} variable name")
    end