do |enc|
      s = "\u3042".encode("UTF-32BE")
      assert_equal(s.dup.force_encoding("ISO-2022-JP").inspect, s.dup.force_encoding(enc).inspect)
      s = "\x00\x00\xFE\xFF"
      assert_equal(s.dup.force_encoding("ISO-2022-JP").inspect, s.dup.force_encoding(enc).inspect)

      assert_equal [0, 0, 254, 255], "\x00\x00\xFE\xFF".force_encoding(enc).codepoints
      assert_equal 0, "\x00\x00\xFE\xFF".force_encoding(enc).ord
      assert_equal 255, "\xFF\xFE\x00\x00".force_encoding(enc).ord
    end