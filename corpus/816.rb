doc_with_blank_less_indented_line_escaped
    result = "    a\n" \
             "\\ \\ \n" \
             "    b\n"
    expect = result
    assert_dedented_heredoc(expect, result)
  end