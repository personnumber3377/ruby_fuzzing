do |port|
        ENV.clear
        ENV["foo"] = "bar"
        ENV["baz"] = "qux"
        a = ENV.to_a
        port.send