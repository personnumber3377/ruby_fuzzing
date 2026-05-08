do |i|
          "\\ufffd".encode(Encoding::US_ASCII, fallback:)
        rescue ArgumentError
        end