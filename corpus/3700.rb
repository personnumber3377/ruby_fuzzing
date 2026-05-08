do
        Process.fork
      rescue Ractor::IsolationError => e
        e
      end