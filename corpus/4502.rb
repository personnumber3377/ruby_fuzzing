dows_31J)
    b = "\x82\xa2".force_encoding(Encoding::Windows_31J)
    c = [/#{a}/, /#{b}/]
    assert_equal(c, Marshal.load(Marshal.dump(c)), bug2109)

    assert_nothing_raised(ArgumentError, '[ruby-dev:40386]') do
      re = IO.pipe do |r, w|
        w.write("\x04\bI/\x00\x00\x06:\rencoding\"\rUS-ASCII")
        # Marshal.load would not overread and block
        Marshal.load(r)
      end