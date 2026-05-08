dog horse).to_enum
    assert_equal("albatross", enum.min)
    assert_equal("dog", enum.min {|a,b| a.length <=> b.length })
    assert_equal(1, [3,2,1].to_enum.min)
    assert_equal(%w[albatross dog], enum.min(2))
    assert_equal(%w[dog horse],
                 enum.min(2) {|a,b| a.length <=> b.length })
    assert_equal([13, 14], [20, 32, 32, 21, 30, 25, 29, 13, 14].to_enum.min(2))
    assert_equal([2, 4, 6, 7], [2, 4, 8, 6, 7].to_enum.min(4))
  end