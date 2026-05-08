do |port|
        ENV["test"] = "foo"
        h = ENV.select {|k| #{ignore_case_str} ? k.upcase == "TEST" : k == "test" }
        port.send