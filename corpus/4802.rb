do |i| # stupid things and make exceptions:
        IO.pipe do |r,w|
          th = Thread.new do
            begin
              while r.gets
              end