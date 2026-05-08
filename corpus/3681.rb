do |port|
        ENV.clear
        ENV["foo"] = "bar"
        ENV["baz"] = "qux"
        a = ENV.shift
        b = ENV.shift
        port.send