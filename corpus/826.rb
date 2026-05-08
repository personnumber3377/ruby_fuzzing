doc_expr_at_beginning
    result = "  a\n" \
             '#{1}'"\n"
    expected = "  a\n" \
             '#{1}'"\n"
    assert_dedented_heredoc(expected, result)
  end