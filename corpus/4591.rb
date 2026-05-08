do
        # StringIO to object with to_path
        bytes = "\xDE\xAD\xBE\xEF".force_encoding(Encoding::ASCII_8BIT)
        src = StringIO.new(bytes)
        dst = Object.new
        def dst.to_path
          "qux"
        end