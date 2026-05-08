do |s|
        s.force_encoding(e)
        enc = (''.force_encoding(e) + s.inspect).encoding
        assert_strenc(s.inspect, enc, format % s)
      end