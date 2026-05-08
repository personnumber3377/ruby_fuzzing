doc_continued_line
    result = "  1\\\n" "  2\n"
    expected = "1\\\n" "2\n"
    assert_dedented_heredoc(expected, result)
    assert_syntax_error("#{<<~"begin;"}\n#{<<~'end