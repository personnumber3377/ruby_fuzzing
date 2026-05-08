docker
      debug_msg = "before_stats: #{before_stats}\nbefore_stat_heap: #{before_stat_heap}\nafter_stats: #{after_stats}\nafter_stat_heap: #{after_stat_heap}"

      # Should not be thrashing in page creation
      assert_in_epsilon before_stats[:heap_allocated_pages], after_stats[:heap_allocated_pages], 0.5, debug_msg
      assert_equal 0, after_stats[:total_freed_pages], debug_msg
    RUBY
  end