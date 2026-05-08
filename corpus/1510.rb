do |path|
    define_method("test_ranges:#{path}") do
      helper = Helper.new("#{SRCDIR}/#{path}")
      helper.validate_range

      assert_equal([], helper.errors)
    end