do
      ENV.instance_variable_get(:@a)
    rescue Ractor::IsolationError => e
      e
    end