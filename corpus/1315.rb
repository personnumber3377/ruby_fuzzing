do
      [[], C.new([])].all? do |i|
        case i
        in *a
          a == []
        end