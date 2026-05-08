do
      eval("#{<<~';;;'}")
      proc do |i|
        case i
        in a:
          0 # line 4
          a
        in "b":
          0 # line 7
          b
        else
          false
        end