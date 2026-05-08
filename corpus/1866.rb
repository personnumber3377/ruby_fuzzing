do
      e.set_backtrace(caller_locations(1, 1) + ["foo"])
    end