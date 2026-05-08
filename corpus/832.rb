doc_mixed_encoding
    e = assert_syntax_error(<<-'HEREDOC', 'UTF-8 mixed within Windows-31J source')
      #encoding: cp932
      <<-TEXT
      \xe9\x9d\u1234
      TEXT
    HEREDOC
    assert_not_match(/end