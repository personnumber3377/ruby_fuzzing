do |f|
      {#
        begin
          s = []
          while c = ARGF.readbyte
            s << c
          end