dout, stderr, wait_thread)
          proc do
            stdin.close rescue nil
            stdout.close rescue nil
            stderr.close rescue nil
            wait_thread.value
          end