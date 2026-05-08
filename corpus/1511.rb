do |path|
    define_method("test_not_cared:#{path}") do
      helper = Helper.new("#{SRCDIR}/#{path}")
      helper.validate_not_cared

      assert_equal([], helper.errors)
    end