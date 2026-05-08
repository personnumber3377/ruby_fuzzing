do
      begin
        rp.call(r)
      rescue Exception
        r.close
        re = $!
      end