do
      eval('raise("recv")::C = raise(ArgumentError, "bar")')
    end