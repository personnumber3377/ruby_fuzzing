document
    x = nil

    assert_syntax_error("<\<FOO\n", /can't find string "FOO"/)

    assert_nothing_raised(SyntaxError) do
      x = eval %q(
<<FOO
#$
FOO
      )
    end