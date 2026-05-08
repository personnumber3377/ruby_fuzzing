do
      ENV.instance_eval{ @a }
    rescue Ractor::IsolationError => e
      e
    end