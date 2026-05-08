do |es|
      enc = Encoding.const_get(es)
      rs = Regexp.new(str.encode(enc)).to_s
      assert_equal("(?-mix:abcd\u3042)".encode(enc), rs)
      assert_equal(enc, rs.encoding)
    end