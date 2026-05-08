doc_unterminated_interpolation
    code = <<~'HEREDOC'
    <<A+1
    #{
    HEREDOC

    assert_syntax_error(code, /can't find string "A"/)
  end