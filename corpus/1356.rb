do
      [{}, C.new({})].all? do |i|
        case i
        in a: 0
        else
          true
        end