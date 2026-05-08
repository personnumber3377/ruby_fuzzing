do
      [{}, C.new({})].all? do |i|
        case i
        in a:
          raise a # suppress "unused variable: a" warning
        else
          true
        end