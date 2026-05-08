dog', 'cat'], a.unshift('dog'))
    assert_equal(@cls[nil, 'dog', 'cat'], a.unshift(nil))
    assert_equal(@cls[@cls[1,2], nil, 'dog', 'cat'], a.unshift(@cls[1, 2]))
  end