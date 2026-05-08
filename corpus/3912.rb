do_not_use_newarraykwsplat
    assert_equal([42, "foo", 424242], f2(*[], 42, **{}))
    a = [1, 2, 3]
    assert_equal([[1,2,3,4,5,6], "foo", 424242, {:k=>:k}], f7(*a, 4,5,6, k: :k))
  end