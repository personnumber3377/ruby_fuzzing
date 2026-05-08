do
      pid = fork do
        exit!(2) unless m.locked?
        m.unlock rescue exit!(3)
        m.synchronize {} rescue exit!(4)
        exit!(0)
      end