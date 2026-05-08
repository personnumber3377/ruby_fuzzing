do
      eval(<<-END, nil, __FILE__, __LINE__)
        def self.sample_backtrace_location
          caller_locations(0).first
        end