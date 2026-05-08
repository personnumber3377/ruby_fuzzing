downcase
    STRINGS.each {|s|
      if !s.valid_encoding?
        assert_raise(ArgumentError, "Offend