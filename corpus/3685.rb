do |port, v|
        ENV["foo"] = "bar"
        #{str_for_yielding_exception_class("ENV['foo'] = v ")}
        port.send