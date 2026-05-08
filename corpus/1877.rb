do
      q.pop
      begin
        raise "caller's cause"
      rescue
        x.raise "stop"
      end