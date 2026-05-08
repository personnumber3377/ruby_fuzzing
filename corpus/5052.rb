do |f|
      {#
        s = +""
        begin
          loop do
            s << ARGF.readpartial(1)
            t = +""; ARGF.readpartial(1, t); s << t
            # not empty buffer
            u = +"abcdef"; ARGF.readpartial(1, u); s << u
          end