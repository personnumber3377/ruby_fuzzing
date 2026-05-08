do
      [{a: 0}, C.new({a: 0})].all? do |i|
        case i
        in **a
          a == {a: 0}
        end