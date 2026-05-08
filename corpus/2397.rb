do |r, e|
      assert_match(VERSION_PATTERN, r[0])
      if (JITSupport.yjit_enabled? && !JITSupport.yjit_force_enabled?) || JITSupport.zjit_enabled?
        assert_equal(NO_JIT_DESCRIPTION, r[0])
      else
        assert_equal(RUBY_DESCRIPTION, r[0])
      end