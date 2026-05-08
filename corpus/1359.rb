do
      [{a: 0}, C.new({a: 0})].all? do |i|
        case i
        in a: 0, b: 1
        else
          true
        end