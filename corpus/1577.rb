dog' ]
    assert_equal('dog', a.pop)
    assert_equal(@cls['cat'], a)
    assert_equal('cat', a.pop)
    assert_equal(@cls[], a)
    assert_nil(a.pop)
    assert_equal(@cls[], a)
  end