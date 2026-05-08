done_q = Thread::Queue.new
    th = Thread.new{
      begin
        Thread.handle_interrupt(RuntimeError => flag){
          begin
            ready_q << true
            done_q.pop
          rescue
            r << :c1
          end