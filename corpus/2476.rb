dom_seed
    assert_equal(0, Random.new(0).seed)
    assert_equal(0x100000000, Random.new(0x100000000).seed)
    assert_equal(2**100, Random.new(2**100).seed)
  end