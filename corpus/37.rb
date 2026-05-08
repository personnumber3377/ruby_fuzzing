doesn't work well on s390x" if RUBY_PLATFORM =~ /s390x/ # https://github.com/ruby/ruby/pull/5077
    a = S("Test") << 1 << 2 << 3 << 9 << 13 << 10
    EnvUtil.under_gc_compact_stress do
      assert_equal(a, S('"Test\\x01\\x02\\x03\\t\\r\\n"').undump)
    end