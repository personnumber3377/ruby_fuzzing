do
      thread = Thread.new do
        Thread.current.report_on_exception = false
        raise
      end