do
        rs << Ractor.new do
          "\u0300".encode(Encoding.list.sample) rescue Encoding::UndefinedConversionError
        end