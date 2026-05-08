do
      [[0, 1, 2], C.new([0, 1, 2])].all? do |i|
        case i
        in *a, 1, 2
          a == [0]
        end