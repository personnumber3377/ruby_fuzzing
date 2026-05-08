doc_no_terminator
    assert_syntax_error("puts <<""A\n", /can't find string "A" anywhere before EOF/)
    assert_syntax_error("puts <<""A + <<""B\n", /can't find string "A" anywhere before EOF/)
    assert_syntax_error("puts <<""A + <<""B\n", /can't find string "B" anywhere before EOF/)
  end