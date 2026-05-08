do
      begin
        q.pop
      rescue RuntimeError
        sleep
      end