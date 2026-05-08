do
      str.scrub do |_|
        str << "1\x002\x00".force_encoding('UTF-16LE')
        "?\x00".force_encoding('UTF-16LE')
      end