do |port|
        ENV.clear
        ENV["foo"] = "bar"
        ENV["baz"] = "qux"
        ENV["bar"] = "rab"
        port.send