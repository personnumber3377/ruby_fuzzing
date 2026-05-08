do |port|
        s = ENV.size
        ENV["test"] = "foo"
        port.send