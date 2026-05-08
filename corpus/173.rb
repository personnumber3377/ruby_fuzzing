do_lambda
    a = b = nil
    assert_nothing_raised do
      eval <<-END, nil, __FILE__, __LINE__+1
        a = -> do
          b = 42
        end