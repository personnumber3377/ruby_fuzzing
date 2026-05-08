do |f|
      {#
        s = +""
        begin
          while c = ARGF.readchar
            s << c
          end