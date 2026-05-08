don't deadlock when
      # the child ruby blocks writing the output to pipe_fd
      pipe_out = nil
      pipe_reader = Thread.new do
        pipe_out = pipe_r.read
        pipe_r.close
      end