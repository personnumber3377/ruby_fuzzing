do
      eval <<-END, nil, __FILE__, __LINE__+1
        "foo" ? 1 : 2
      END
    end