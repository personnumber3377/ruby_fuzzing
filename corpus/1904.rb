do
      begin
        raise "error 1"
      rescue => e1
        raise "error 2" rescue raise e1, cause: $!
      end