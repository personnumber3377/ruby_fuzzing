doc_without_indentation
    result = " y\n" \
             "z\n"
    expect = result
    assert_dedented_heredoc(expect, result)
  end