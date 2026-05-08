do
      e1 = assert_raise(SyntaxError) do
        eval(src, nil, __FILE__, line)
      end