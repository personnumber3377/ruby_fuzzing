do |i|
      env = {"RUBY_GC_HEAP_OLDOBJECT_LIMIT_FACTOR" => "0", "RUBY_GC_HEAP_REMEMBERED_WB_UNPROTECTED_OBJECTS_LIMIT_RATIO" => i}
      assert_separately([env, "-W0"], __FILE__, __LINE__, <<~RUBY)
        GC.disable
        GC.start
        assert_equal((GC.stat[:old_objects] * #{i}).to_i, GC.stat[:remembered_wb_unprotected_objects_limit])
      RUBY
    end