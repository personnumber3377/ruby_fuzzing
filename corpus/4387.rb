do |line, r, enc, ex|
      code = "# -*- encoding: US-ASCII -*-\n#{r}.encoding"
      if ex
        assert_raise(ex) {eval(code, nil, __FILE__, line-1)}
      else
        assert_equal(enc, eval(code, nil, __FILE__, line-1))
      end