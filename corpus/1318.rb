do
      [[0, 1], C.new([0, 1])].all? do |i|
        case i
        in *a, 0, 1
          a == []
        end