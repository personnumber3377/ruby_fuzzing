doc_after_label
    bug11849 = '[ruby-core:72396] [Bug #11849]'
    assert_valid_syntax("{label:<<DOC\n""DOC\n""}", bug11849)
    assert_valid_syntax("{label:<<-DOC\n""DOC\n""}", bug11849)
    assert_valid_syntax("{label:<<~DOC\n""DOC\n""}", bug11849)
    assert_valid_syntax("{label: <<DOC\n""DOC\n""}", bug11849)
    assert_valid_syntax("{label: <<-DOC\n""DOC\n""}", bug11849)
    assert_valid_syntax("{label: <<~DOC\n""DOC\n""}", bug11849)
  end