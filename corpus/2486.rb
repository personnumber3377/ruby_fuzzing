do |r, w|
      (1..n).map do
        st = desc = nil
        IO.pipe do |re, we|
          p1 = fork {
            re.close
            STDERR.reopen(we)
            w.puts(block.call.to_s)
          }
          we.close
          err = Thread.start {re.read}
          _, st = Process.waitpid2(p1)
          desc = FailDesc[st, mesg, err.value]
        end