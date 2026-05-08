do
      x = "bar"
      eval <<-END, nil, __FILE__, __LINE__+1
        /foo#{x}baz/ ? 1 : 2
      END
    end