do |port|
        h1 = {}
        ENV.each_pair {|k, v| h1[k] = v }
        ENV["test"] = "foo"
        ENV.keep_if {|k, v| #{ignore_case_str} ? k.upcase != "TEST" : k != "test" }
        h2 = {}
        ENV.each_pair {|k, v| h2[k] = v }
        port.send