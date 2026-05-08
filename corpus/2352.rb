dog horse)
    assert_equal("dog", a.min_by {|x| x.length })
    assert_equal(3, [2,3,1].min_by {|x| -x })
    assert_equal(%w[dog horse], a.min_by(2) {|x| x.length })
    assert_equal([13, 14], [20, 32, 32, 21, 30, 25, 29, 13, 14].min_by(2) {|x| x})
  end