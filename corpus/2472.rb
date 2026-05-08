dom_gc
    r = Random.new(0)
    3.times do
      assert_kind_of(Integer, r.rand(0x100000000))
    end