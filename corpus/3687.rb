do |port|
        ENV["#{PATH_ENV}"] = "/"
        ENV.each do |k, v|
          port.send