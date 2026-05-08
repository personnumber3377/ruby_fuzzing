dog horse)
    assert_equal("albatross", ary.min)
    assert_equal("dog", ary.min {|a,b| a.length <=> b.length })
    assert_equal(1, [3,2,1].min)
    assert_equal(%w[albatross dog], ary.min(2))
    assert_equal(%w[dog horse],
                 ary.min(2) {|a,b| a.length <=> b.length })
    assert_equal([13, 14], [20, 32, 32, 21, 30, 25, 29, 13, 14].min(2))
    assert_equal([2, 4, 6, 7], [2, 4, 8, 6, 7].min(4))

    class << (obj = Object.new)
      def <=>(x) 1 <=> x end