do |port|
        ENV.clear
        ENV["foo"] = "bar"
        ENV["baz"] = "qux"
        s = ENV.inspect
        port.send