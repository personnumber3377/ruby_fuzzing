do |version_args|
      assert_in_out_err(version_args) do |stdout, stderr|
        assert_equal(RUBY_DESCRIPTION, stdout.first)
        assert_equal([], stderr)
      end