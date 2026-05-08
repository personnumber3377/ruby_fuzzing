do
        rs << Ractor.new do
          50.times do
            if (val = Encoding::Converter.asciicompat_encoding(NO_EXIST))
              raise "Got #{val}, expected nil"
            end