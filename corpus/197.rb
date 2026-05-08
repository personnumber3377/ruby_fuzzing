document identifier/)

    assert_syntax_error("<<``\n", /can't find string ""/)

    assert_syntax_error("<<--\n", /unexpected <</)

    assert_nothing_raised(SyntaxError) do
      x = eval %q(
<<FOO
#$
foo
FOO
      )
    end