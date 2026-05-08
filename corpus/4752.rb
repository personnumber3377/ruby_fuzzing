do |r,w|
        $stdin.reopen(r)
        r.close
        read_thread = Thread.new do
          begin
            $stdin.read(1)
          rescue IOError => e
            e
          end