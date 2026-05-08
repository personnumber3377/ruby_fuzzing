do
      [[0], C.new([0])].all? do |i|
        case i
        in *a, 0, 1
          raise a # suppress "unused variable: a" warning
        else
          true
        end