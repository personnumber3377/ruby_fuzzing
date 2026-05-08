do
      [{}, C.new({})].all? do |i|
        case i
        in **nil
          true
        end