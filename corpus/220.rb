do
        eval <<-END, nil, __FILE__, __LINE__+1
          if Const = true
            1
          else
            2
          end