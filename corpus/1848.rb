do
      begin
        raise "exception in rescue clause"
      rescue
        raise string
      end