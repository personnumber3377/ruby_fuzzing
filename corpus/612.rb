do
        rs << Ractor.new(autoload_encodings) do |encodings|
          str = "abc".dup
          encodings.each do |enc|
            str.force_encoding(enc)
          end