do |sizeof_short|
        buf = [ 1, 2,  3,  4,  5,  6,  7,  8,
                -1, -2, -3, -4, -5, -6, -7, -8].pack("s*")
        shape = [2, 4]
        strides = [4*sizeof_short*2, sizeof_short*2]
        mv = MemoryViewTestUtils::MultiDimensionalView.new(buf, "ss", shape, strides)
        p mv[[0, 2]]
        mv[[1, 3]]
      end