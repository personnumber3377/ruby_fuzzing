do |r|
      assert_equal(Encoding.default_external, r.external_encoding)
      assert_equal(nil, r.internal_encoding)
      s = r.read
      assert_equal(Encoding.default_external, s.encoding)
      assert_str_equal(utf8.dup.force_encoding(Encoding.default_external), s)
    end