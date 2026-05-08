do
      assert_equal(Encoding.find("US-ASCII"), Regexp.new("b..", Regexp::NOENCODING).encoding)
      assert_equal("bar", "foobarbaz"[Regexp.new("b..", Regexp::NOENCODING)])
      assert_equal(//, Regexp.new(""))
      assert_equal(//, Regexp.new("", timeout: 1))
      assert_equal(//n, Regexp.new("", Regexp::NOENCODING))
      assert_equal(//n, Regexp.new("", Regexp::NOENCODING, timeout: 1))

      assert_equal(arg_encoding_none, Regexp.new("", Regexp::NOENCODING).options)

      assert_nil(Regexp.new("").timeout)
      assert_equal(1.0, Regexp.new("", timeout: 1.0).timeout)
      assert_nil(Regexp.compile("").timeout)
      assert_equal(1.0, Regexp.compile("", timeout: 1.0).timeout)
    end