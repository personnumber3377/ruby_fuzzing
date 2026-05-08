do |n|
      t = make_tempfile(n.encode(ext))
    rescue Encoding::UndefinedConversionError
    end