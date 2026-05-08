doesn't work well on s390x" if RUBY_PLATFORM =~ /s390x/ # https://github.com/ruby/ruby/pull/5077
    EnvUtil.under_gc_compact_stress { assert_equal([["1a"], ["2b"], ["3c"]], S("1a2b3c").scan(/(\d.)/)) }
  end