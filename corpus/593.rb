do |stdout, stderr|
      assert_includes(stdout.first, '+ZJIT')
      assert_equal([], stderr)
    end