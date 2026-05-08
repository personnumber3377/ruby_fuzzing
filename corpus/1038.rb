dom
    assert_hash_random(0)
    assert_hash_random(+1)
    assert_hash_random(-1)
    assert_hash_random(+(1<<100))
    assert_hash_random(-(1<<100))
  end