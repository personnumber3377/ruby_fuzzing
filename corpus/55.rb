doesn't work well on s390x" if RUBY_PLATFORM =~ /s390x/ # https://github.com/ruby/ruby/pull/5077
    EnvUtil.under_gc_compact_stress do
      m = /&(?<foo>.*?);/.match(S("aaa &amp; yyy"))
      assert_equal("amp", m["foo"])

      assert_equal("aaa [amp] yyy", S("aaa &amp; yyy").sub(/&(?<foo>.*?);/, S('[\k<foo>]')))
    end