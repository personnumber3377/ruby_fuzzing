down
    Thread::Threads.each do |t|
      t.kill if t.alive?
      begin
        t.join
      rescue Exception
      end