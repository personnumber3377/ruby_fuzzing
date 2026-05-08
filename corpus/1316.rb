do
      [[0], C.new([0])].all? do |i|
        case i
        in *a
          a == [0]
        end