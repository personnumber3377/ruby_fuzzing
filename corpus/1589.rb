doesn't work well on s390x" if RUBY_PLATFORM =~ /s390x/ # https://github.com/ruby/ruby/pull/5077
    EnvUtil.under_gc_compact_stress { assert_equal([1, 2, 3, 4, 5], (0..10).to_a[1, 5]) }
    EnvUtil.under_gc_compact_stress do
      a = [0, 1, 2, 3, 4, 5]
      assert_equal([2, 1, 0], a.slice((2..).step(-1)))
    end