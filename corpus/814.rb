doc_with_indentation
    result = "     a\n" \
             "    b\n"
    expect = " a\n" \
             "b\n"
    assert_dedented_heredoc(expect, result)
  end