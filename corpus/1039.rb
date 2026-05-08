dom
    assert_hash_random(0.0)
    assert_hash_random(+1.0)
    assert_hash_random(-1.0)
    assert_hash_random(1.72723e-77)
    assert_hash_random(Float::INFINITY, "Float::INFINITY")
  end