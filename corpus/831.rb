doc_concatenation
    assert_equal(" \n0\n1", eval("<<~0 '1'\n \n0\#{}\n0"))
  end