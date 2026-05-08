do |port|
        ENV["foo"] = "xxx"
        ENV.replace({"foo"=>"bar", "baz"=>"qux"})
        port.send