do
      File.mkfifo("fifo")
    rescue NotImplementedError
    else
      wait = EnvUtil.apply_timeout_scale(0.1)
      data = "writing to fifo"

      # Do not use assert_separately, because reading from stdin
      # prevents to reproduce [Bug #20708]
      assert_in_out_err(["-e", "#{<<~"begin;"}\n#{<<~'end