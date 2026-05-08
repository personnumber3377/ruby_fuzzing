do
        rs << Ractor.new(autoload_encodings) do |encodings|
          str = "\u0300"
          encodings.each do |enc|
            str.encode(enc) rescue Encoding::UndefinedConversionError
          end