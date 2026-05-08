doesn't work well on s390x" if RUBY_PLATFORM =~ /s390x/ # https://github.com/ruby/ruby/pull/5077
    EnvUtil.under_gc_compact_stress do
      assert_equal([[1, 0], [2, 1], [3, 2]], @obj.to_enum(:foo, 1, 2, 3).with_index.to_a)
      assert_equal([[1, 5], [2, 6], [3, 7]], @obj.to_enum(:foo, 1, 2, 3).with_index(5).to_a)

      s = 1 << (8 * 1.size - 2)
      assert_equal([[1, s], [2, s + 1], [3, s + 2]], @obj.to_enum(:foo, 1, 2, 3).with_index(s).to_a)
    end