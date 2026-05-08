do
        Process.waitpid(-1)
      rescue Errno::ECHILD
        nil
      end