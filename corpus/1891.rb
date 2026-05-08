do
      ::Warning.warn "\x00a\x00b\x00c".force_encoding("utf-16be")
    end