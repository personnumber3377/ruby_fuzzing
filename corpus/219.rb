do
      eval <<-END, nil, __FILE__, __LINE__+1
        c = Class.new
        class << c
          if @@a = 1
          end