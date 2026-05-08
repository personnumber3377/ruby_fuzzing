do
      [{a: 0}, C.new({a: 0})].all? do |i|
        case i
        in a:, **b
          a == 0 && b == {}
        end