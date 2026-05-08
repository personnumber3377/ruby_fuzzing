do |port|
        ENV.clear
        ENV["foo"] = "bar"
        ENV["baz"] = "qux"
        ENV.update({"baz"=>"quux","a"=>"b"})
        port.send