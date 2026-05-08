do |i|
        a = []
        t = []
        10.times do
          r,w = IO.pipe
          a << [r,w]
          t << Thread.new do
            begin
              while r.gets
              end