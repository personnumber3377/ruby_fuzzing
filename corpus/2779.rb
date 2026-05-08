do
      e2 = assert_raise(SyntaxError) do
        ISeq.new(src, __FILE__, __FILE__, line)
      end