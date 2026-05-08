doc_identifier
    term = "A"*257
    ast = parse("<<-#{term}\n""ddddddd\n#{term}\n")
    node = ast.children[2]
    assert_equal(:STR, node.type)
    assert_equal(0, node.first_column)
  end