do |port|
        #{str_for_yielding_exception_class("ENV['test'] = nil")}
        ENV["test"] = nil
        port.send