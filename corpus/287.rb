do
      TracePoint.new(:line) {
        next if !target_thread?
        raise
      }.enable {
        1
      }
    end