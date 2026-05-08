doc_with_newline
    bug11989 = '[ruby-core:72855] [Bug #11989] after escaped newline should not be dedented'
    result = '  x\n'"  y\n" \
             "  z\n"
    expect = 'x\n'"  y\n" \
             "z\n"
    assert_dedented_heredoc(expect, result, bug11989)
  end