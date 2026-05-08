do |r, w|
        pid = fork { r.read(1); exit }
        th = Thread.start {
          Thread.current.report_on_exception = false
          raise
        }
        w.puts
      end