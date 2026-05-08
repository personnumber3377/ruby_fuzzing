do |port|
        val = 'a'
        val.succ! while ENV.has_value?(val) || ENV.has_value?(val.upcase)
        ENV['test'] = val[0...-1]
        port.send