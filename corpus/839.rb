doc_cr
    assert_syntax_error("puts <<""EOS\n""ng\n""EOS\r""NO\n", /can't find string "EOS" anywhere before EOF/)
  end