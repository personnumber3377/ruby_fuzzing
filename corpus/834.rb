dows-31J source')
      #encoding: cp932
      <<-TEXT
      \u1234\xe9\x9d
      TEXT
    HEREDOC
    assert_not_match(/end