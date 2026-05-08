do
      assert_raise(*exs, mesg) do
        begin
          loop do
            Process.spawn(cmds.join(sep), opts)
            min = [cmds.size, min].max
            begin
              cmds *= 100
            rescue ArgumentError
              raise NoMemoryError
            end