does not respond to #deconstruct_keys") do
      0 => {a:}
      raise a # suppress "unused variable: a" warning
    end