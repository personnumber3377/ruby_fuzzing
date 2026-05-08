do |port|
        #{str_to_yield_invalid_envvar_errors("v", "ENV[v]")}
        ENV["#{PATH_ENV}"] = ""
        port.send