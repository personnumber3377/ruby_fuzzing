do
      [{}, C.new({})].all? do |i|
        case i
        in a:, **b
          raise a # suppress "unused variable: a" warning
          raise b # suppress "unused variable: b" warning
        else
          true
        end