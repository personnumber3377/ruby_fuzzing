doc
    assert_syntax_error("<<\"EOS\n\nEOS\n", /unterminated/)
    assert_syntax_error("<<\"EOS\n\"\nEOS\n", /unterminated/)
  end