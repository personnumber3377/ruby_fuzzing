do
      [
        Encoding::UTF_16BE,
        Encoding::UTF_16LE,
        Encoding::UTF_32BE,
        Encoding::UTF_32LE,
        Encoding::UTF8_SOFTBANK
      ].each do |e|
        str = "abc".encode(e)
        assert_equal('"abc"', str.inspect)
      end