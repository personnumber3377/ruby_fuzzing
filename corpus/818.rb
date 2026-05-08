doc_with_leading_blank_line
    # the blank line has six leading spaces
    result = "      \n" \
             "    b\n"
    expect = "  \n" \
             "b\n"
    assert_dedented_heredoc(expect, result)
  end