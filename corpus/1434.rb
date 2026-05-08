does not return true") do
      {} => Array[a:]
      raise a # suppress "unused variable: a" warning
    end