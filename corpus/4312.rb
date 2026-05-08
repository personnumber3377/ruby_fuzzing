do
      unless f = IO.popen("-")
        STDERR.reopen(STDOUT)
        exit
      end