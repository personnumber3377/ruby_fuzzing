done = false
      th = Thread.new{
        q.push :e
        begin
          begin
            Thread.pass until done
          rescue
            q.push :ng1
          end