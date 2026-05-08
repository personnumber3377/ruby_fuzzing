doc
    node = parse("<<-SRC\nddddddd\nSRC\n").children[2]
    assert_equal(:STR, node.type)
    assert_equal(0, node.first_column)
    assert_equal(6, node.last_column)

    node = parse("<<SRC\nddddddd\nSRC\n").children[2]
    assert_equal(:STR, node.type)
    assert_equal(0, node.first_column)
    assert_equal(5, node.last_column)
  end