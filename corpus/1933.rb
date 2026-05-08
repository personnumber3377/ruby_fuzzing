doesn't work well on s390x" if RUBY_PLATFORM =~ /s390x/ # https://github.com/ruby/ruby/pull/5077
    EnvUtil.under_gc_compact_stress do
      str = "abcd\u3042"
      [:UTF_16BE, :UTF_16LE, :UTF_32BE, :UTF_32LE].each do |es|
        enc = Encoding.const_get(es)
        rs = Regexp.new(str.encode(enc)).to_s
        assert_equal("(?-mix:abcd\u3042)".encode(enc), rs)
        assert_equal(enc, rs.encoding)
      end