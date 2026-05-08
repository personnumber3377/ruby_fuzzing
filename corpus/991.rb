dog', 'cat', 'horse')
    assert_equal(3, res.length)
    assert_equal([nil, nil, nil], res)

    res = @h.values_at
    assert_equal(0, res.length)

    res = @h.values_at(3, 2, 1, nil)
    assert_equal 4, res.length
    assert_equal %w( three two one nil ), res

    res = @h.values_at(3, 99, 1, nil)
    assert_equal 4, res.length
    assert_equal ['three', nil, 'one', 'nil'], res
  end