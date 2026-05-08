dout = open(IO::NULL, "w")
      begin
        Timeout.timeout(5) do
          Tracer.on
          HogeError.new.to_s
        end