do
        Process.waitpid long_pid
      rescue Errno::ECHILD
        nil
      end