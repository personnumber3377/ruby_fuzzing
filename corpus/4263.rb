do
      c = GC.count
      GC.start
      assert_equal 1, GC.count - c
    end