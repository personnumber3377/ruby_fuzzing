do
      buf = ''
      File.open(t.path, "r") do |r|
        while yield(r, size, buf)
          w << buf.dup
        end