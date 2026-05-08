do |f|
      {#
        s = +""
        begin
          loop do
            s << ARGF.readpartial(1)
            t = +""; ARGF.readpartial(1, t); s << t
          end