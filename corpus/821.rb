doc_with_interpolated_expression
    result = '  #{1}a'"\n" \
             " zy\n"
    expect = ' #{1}a'"\n" \
             "zy\n"
    assert_dedented_heredoc(expect, result)
  end