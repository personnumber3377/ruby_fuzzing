do |newline|
        File.open(path, "rt", newline: newline) do |f|
          f.read
        end