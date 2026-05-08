do
        10.times {
          sleep 0.1
          Process.kill("INT", pid) rescue break
        }
      end