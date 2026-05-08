do
      r, w = IO.pipe
      a << [r, w]
      t << Thread.new do
        while r.gets
        end