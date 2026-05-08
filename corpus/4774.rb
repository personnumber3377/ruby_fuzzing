do |r, size, buf|
      begin
        r.readpartial(size, buf)
      rescue EOFError
        nil
      end