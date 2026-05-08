do
      [[0], C.new([0])].all? do |i|
        case i
        in 0, 1
        else
          true
        end