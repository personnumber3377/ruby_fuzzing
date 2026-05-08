do
      begin
        x = Float("0x1."+"0"*270)
      rescue ArgumentError => e
        raise unless /"0x1\.0{270}"/ =~ e.message
      else
        break
      end