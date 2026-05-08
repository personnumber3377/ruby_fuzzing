do |port|
        port << ENV['test']
        port << ENV['TEST']
        ENV['test'] = 'foo'
        port << ENV['test']
        port << ENV['TEST']
        ENV['TEST'] = 'bar'
        port << ENV['TEST']
        port << ENV['test']
        #{str_for_yielding_exception_class("ENV[1]")}
        #{str_for_yielding_exception_class("ENV[1] = 'foo'")}
        #{str_for_yielding_exception_class("ENV['test'] = 0")}
      end