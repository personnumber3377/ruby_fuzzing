do
      begin
        wp.call(w)
      rescue Exception
        w.close
        we = $!
      end