do |port|
        h = {}
        ENV.each {|k, v| h[k] = v }
        port.send