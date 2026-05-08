doesn't support

    assert_equal(2, x[1])

    assert(begin
         for k,v in y
           raise if k*2 != v
         end