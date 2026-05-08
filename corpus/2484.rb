dom_equal
    r = Random.new(0)
    assert_equal(r, r)
    assert_equal(r, r.dup)
    r1 = r.dup
    r2 = r.dup
    r1.rand(0x100)
    assert_not_equal(r1, r2)
    r2.rand(0x100)
    assert_equal(r1, r2)
  end