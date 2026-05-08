dog horse)
    assert_equal(["albatross", "horse"], ary.minmax)
    assert_equal(["dog", "albatross"], ary.minmax {|a,b| a.length <=> b.length })
    assert_equal([1, 3], [3,2,1].minmax)

    class << (obj = Object.new)
      def <=>(x) 1 <=> x end