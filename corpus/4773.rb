do |r, size, buf|
      begin
        r.sysread(size, buf)
      rescue EOFError
        nil
      end