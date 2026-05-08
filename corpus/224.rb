do
      eval <<-END, nil, __FILE__, __LINE__+1
        ("foo".."bar") ? 1 : 2
      END
    end