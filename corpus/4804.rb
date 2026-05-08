do
        Thread.handle_interrupt(StandardError => :on_blocking) do
          begin
            IO.select(rset, wset)
          rescue
            retry
          end