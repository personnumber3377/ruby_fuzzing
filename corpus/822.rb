doc_with_interpolated_string
    w = w = ""
    result = " \#{mesg} a\n" \
             "  zy\n"
    expect = '#{mesg} a'"\n" \
             ' zy'"\n"
    assert_dedented_heredoc(expect, result)
  end