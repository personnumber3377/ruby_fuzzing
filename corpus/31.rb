do |r, w|
        pid = fork do
          r.close
          STDERR.reopen(w)
          at_exit do
            $!.class
          end