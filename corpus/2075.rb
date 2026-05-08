do |signo|
        signame = Signal.signame(signo)
        Marshal.dump(signame, STDOUT)
        STDOUT.flush
        exit 0
      end