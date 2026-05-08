do |i|
          "\\ufffd".encode(Encoding::US_ASCII, fallback:)
        rescue MyError
        end