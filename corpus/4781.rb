do
          sleep wait; Process.kill(:USR1, $$)
          sleep wait; File.write("fifo", data)
        end