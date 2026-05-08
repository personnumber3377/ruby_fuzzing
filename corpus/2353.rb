dog horse)
    assert_equal("albatross", a.max_by {|x| x.length })
    assert_equal(1, [2,3,1].max_by {|x| -x })
    assert_equal(%w[albatross horse], a.max_by(2) {|x| x.length })
    assert_equal([3, 2], [0, 0, 0, 0, 0, 0, 1, 3, 2].max_by(2) {|x| x})
  end