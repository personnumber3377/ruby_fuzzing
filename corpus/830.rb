doc_invalid_identifer
    assert_syntax_error('<<~ "#{}"', /unexpected <</)
  end