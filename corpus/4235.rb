do
      GC.enable
      assert_equal(false, GC.enable)
      assert_equal(false, GC.disable)
      assert_equal(true, GC.disable)
      assert_equal(true, GC.disable)
      assert_nil(GC.start)
      assert_equal(true, GC.enable)
      assert_equal(false, GC.enable)
    end