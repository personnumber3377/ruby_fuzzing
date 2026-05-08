do
      channel = Ractor::Port.new
      Ractor.new(channel) do
        inbound_work = Ractor::Port.new
        channel << inbound_work
      end