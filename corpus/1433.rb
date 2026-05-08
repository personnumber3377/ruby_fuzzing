does not match to find pattern") do
      [0] => [*, {a:}, *]
      raise a # suppress "unused variable: a" warning
    end