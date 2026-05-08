doesn't work well on s390x" if RUBY_PLATFORM =~ /s390x/ # https://github.com/ruby/ruby/pull/5077
    EnvUtil.under_gc_compact_stress do
      ea = (10..).lazy.select(&:even?).take(10)
      ed = (20..).lazy.select(&:odd?)
      chain = (ea + ed).select{|x| x % 3 == 0}
      assert_equal(12, chain.next)
      assert_equal(18, chain.next)
      assert_equal(24, chain.next)
      assert_equal(21, chain.next)
      assert_equal(27, chain.next)
      assert_equal(33, chain.next)
    end