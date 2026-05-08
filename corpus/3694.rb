do
      ENV.instance_eval{ @b = "hello" }
    rescue Ractor::IsolationError => e
      e
    end