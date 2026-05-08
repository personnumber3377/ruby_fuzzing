do
      # an access check).
      # Skip these two assertions in that case.
      unless root_without_capabilities?
        assert_bool_equal(stat.writable?, File.writable?(f), f)
        assert_bool_equal(stat.writable_real?, File.writable_real?(f), f)
      end