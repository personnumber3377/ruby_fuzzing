do |r,w|
      read_thread = Thread.new do
        begin
          r.read(1)
        rescue => e
          e
        end