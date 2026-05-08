do |rd|
          nr = 30
          begin
            pid = fork do
              s1.close
              IO.select([s2])
              Process.kill(:USR2, Process.ppid)
              buf = String.new(capacity: 16384)
              nil while s2.read(16384, buf)
            end