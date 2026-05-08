do |port|
        h1 = {}
        ENV.each_pair {|k, v| h1[k] = v }
        ENV["test"] = "foo"
        h2 = ENV.reject {|k, v| #{ignore_case_str} ? k.upcase == "TEST" : k == "test" }
        port.send