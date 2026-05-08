doc_with_blank_more_indented_line
    # the blank line has six leading spaces
    result = "    a\n" \
             "      \n" \
             "    b\n"
    expect = "a\n" \
             "  \n" \
             "b\n"
    assert_dedented_heredoc(expect, result)
  end