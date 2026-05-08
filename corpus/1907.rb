doesn't work well on s390x" if RUBY_PLATFORM =~ /s390x/ # https://github.com/ruby/ruby/pull/5077
    EnvUtil.under_gc_compact_stress do
      e = RuntimeError.new("foo\nbar\nbaz")
      assert_equal("foo (RuntimeError)\nbar\nbaz", e.detailed_message)
      assert_equal("\e[1mfoo (\e[1;4mRuntimeError\e[m\e[1m)\e[m\n\e[1mbar\e[m\n\e[1mbaz\e[m", e.detailed_message(highlight: true))
    end