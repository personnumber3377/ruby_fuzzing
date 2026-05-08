do
        # StringIO to object with to_path
        bytes = "\xDE\xAD\xBE\xEF".force_encoding(Encoding::ASCII_8BIT)
        File.binwrite("qux", bytes)
        dst = StringIO.new
        src = Object.new
        def src.to_path
          "qux"
        end