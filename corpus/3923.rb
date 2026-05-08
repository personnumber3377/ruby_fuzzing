do |enc|
      next if enc.dummy?
      {"A"=>"B", "A1"=>"A2", "A9"=>"B0", "9"=>"10", "Z"=>"AA"}.each do |orig, expected|
        s = orig.encode(enc)
        assert_strenc(expected.encode(enc), enc, s.succ, proc {"#{orig.dump}.encode(#{enc}).succ"})
      end