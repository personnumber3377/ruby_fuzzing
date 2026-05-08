doesn't work well on s390x" if RUBY_PLATFORM =~ /s390x/ # https://github.com/ruby/ruby/pull/5077
    EnvUtil.under_gc_compact_stress do
      assert_equal('/(?-mix:\\/)|/', Regexp.union(/\//, "").inspect)
    end