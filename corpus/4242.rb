dom.new.bytes(100 * 1024 * 1024)
      GC.start

      time_after = GC.stat(:time)

      # If time measurement is disabled, the time stat should not change
      assert_equal time_before, time_after
    RUBY
  end