do
      [[0, 1, 2], C.new([0, 1, 2])].all? do |i|
        case i
        in *, 1, 2
          true
        end