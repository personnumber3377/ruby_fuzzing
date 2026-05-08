do |port|
        ENV["test"] = "foo"
        h = ENV.filter {|k| #{ignore_case_str} ? k.upcase == "TEST" : k == "test" }
        port.send