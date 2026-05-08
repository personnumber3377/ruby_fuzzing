do |io|
      pid1 = io.pid
      io.close_read
      pid2 = io.pid
    end