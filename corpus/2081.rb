do
        sleep 0.1
        Process.kill("TERM", $$)
      end