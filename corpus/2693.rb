does_not_mutate_other_set
    a = Set[1]
    b = Set[1, 2]
    original_b = b.dup

    result = a ^ b

    assert_equal(original_b, b)
    assert_equal(Set[2], result)
  end