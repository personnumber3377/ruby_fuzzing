do
      begin
        Thread.handle_interrupt(Object => :never){
          Thread.current.raise RuntimeError.new("have to be rescured")
          break
        }
      rescue
      end