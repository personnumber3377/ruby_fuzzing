doc_expr_string
    result = '  one#{"  two  "}'"\n"
    expected = 'one#{"  two  "}'"\n"
    assert_dedented_heredoc(expected, result)
  end