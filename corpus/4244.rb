don't run assertions until we perform the major GC.
      need_major_by = GC.latest_gc_info(:need_major_by)
      GC.start(full_mark: false) # should be upgraded to major
      major_by = GC.latest_gc_info(:major_by)

      assert_not_nil(need_major_by)
      assert_not_nil(major_by)
    end