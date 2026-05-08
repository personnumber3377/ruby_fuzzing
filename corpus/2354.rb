dog horse)
    assert_equal(["dog", "albatross"], a.minmax_by {|x| x.length })
    assert_equal([3, 1], [2,3,1].minmax_by {|x| -x })
  end