do |stdout, stderr|
      assert_equal(RUBY_DESCRIPTION, stdout.first)
      assert_equal([], stderr)
    end