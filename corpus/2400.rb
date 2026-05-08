do |r, e|
      assert_match(VERSION_PATTERN, r[0])
      if ENV['RUBY_YJIT_ENABLE'] == '1'
        assert_equal(NO_JIT_DESCRIPTION, r[0])
      elsif JITSupport.yjit_enabled? || JITSupport.zjit_enabled? # checking -DYJIT_FORCE_ENABLE
        assert_equal(EnvUtil.invoke_ruby(['-e', 'print RUBY_DESCRIPTION'], '', true).first, r[0])
      else
        assert_equal(RUBY_DESCRIPTION, r[0])
      end