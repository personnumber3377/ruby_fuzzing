dog horse).to_enum
    assert_equal("horse", enum.max)
    assert_equal("albatross", enum.max {|a,b| a.length <=> b.length })
    assert_equal(1, [3,2,1].to_enum.max{|a,b| b <=> a })
    assert_equal(%w[horse dog], enum.max(2))
    assert_equal(%w[albatross horse],
                 enum.max(2) {|a,b| a.length <=> b.length })
    assert_equal([3, 2], [0, 0, 0, 0, 0, 0, 1, 3, 2].to_enum.max(2))
  end