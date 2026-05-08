doc_with_empty_line
    result = "      This would contain specially formatted text.\n" \
             "\n" \
             "      That might span many lines\n"
    expect = 'This would contain specially formatted text.'"\n" \
             ''"\n" \
             'That might span many lines'"\n"
    assert_dedented_heredoc(expect, result)
  end