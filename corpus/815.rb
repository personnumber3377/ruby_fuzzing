doc_with_blank_less_indented_line
    # the blank line has two leading spaces
    result = "    a\n" \
             "  \n" \
             "    b\n"
    expect = "a\n" \
             "\n" \
             "b\n"
    assert_dedented_heredoc(expect, result)
  end