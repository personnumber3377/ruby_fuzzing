do
        rs << Ractor.new do
          string = "ISO-2022-JP"
          encoding = Encoding.find(string)
          20_000.times do
            Encoding::Converter.asciicompat_encoding(string)
            Encoding::Converter.asciicompat_encoding(encoding)
          end