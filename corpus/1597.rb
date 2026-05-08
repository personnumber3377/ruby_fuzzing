dog horse)
    assert_equal("horse", ary.max)
    assert_equal("albatross", ary.max {|a,b| a.length <=> b.length })
    assert_equal(1, [3,2,1].max{|a,b| b <=> a })
    assert_equal(%w[horse dog], ary.max(2))
    assert_equal(%w[albatross horse],
                 ary.max(2) {|a,b| a.length <=> b.length })
    assert_equal([3, 2], [0, 0, 0, 0, 0, 0, 1, 3, 2].max(2))

    class << (obj = Object.new)
      def <=>(x) 1 <=> x end