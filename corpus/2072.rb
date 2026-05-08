do
        x = false
        Process.kill(SignalException.new(:INT).signo, $$)
        sleep(0.01) until x

        x = false
        Process.kill("INT", $$)
        sleep(0.01) until x

        x = false
        Process.kill("SIGINT", $$)
        sleep(0.01) until x

        x = false
        o = Object.new
        def o.to_str; "SIGINT"; end