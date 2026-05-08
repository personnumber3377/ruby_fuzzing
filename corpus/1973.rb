do |enc|
      o_acute_lower = "\u00F3".encode(enc)
      o_acute_upper = "\u00D3".encode(enc)
      assert_match(/[x#{o_acute_lower}]/i, "abc#{o_acute_upper}", "should match o acute case insensitive")

      e_acute_lower = "\u00E9".encode(enc)
      e_acute_upper = "\u00C9".encode(enc)
      assert_match(/[x#{e_acute_lower}]/i, "CAF#{e_acute_upper}", "should match e acute case insensitive")
    end