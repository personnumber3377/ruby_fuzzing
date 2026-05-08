do
      c = GC.count
      GC.start(immediate_mark: false, immediate_sweep: false)
      10_000.times { Object.new }
      assert_equal 1, GC.count - c
    end