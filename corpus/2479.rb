dom_bytes
    srand(0)
    r = Random.new(0)

    assert_equal("", r.bytes(0))
    assert_equal("", Random.bytes(0))

    x = r.bytes(1)
    assert_equal(1, x.bytesize)
    assert_equal(x, Random.bytes(1))

    x = r.bytes(10)
    assert_equal(10, x.bytesize)
    assert_equal(x, Random.bytes(10))
  end