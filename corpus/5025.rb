do |f|
      f.binmode if binmode
      f.puts(*data)
      f
    end