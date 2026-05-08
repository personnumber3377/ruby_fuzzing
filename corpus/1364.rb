do
      [{a: 0, b: 1}, C.new({a: 0, b: 1})].all? do |i|
        case i
        in a:
          a == 0
        end