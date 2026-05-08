do |v|
        @current = v
        if v.is_a? Enumerable
          yield(*v)
        else
          yield(v)
        end