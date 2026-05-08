do |f|
      pid = f.pid
      f.gets
      t0 = Time.now
      th = Thread.start(Thread.current) do |main|
        Thread.pass until main.stop?
        main.raise Interrupt
      end