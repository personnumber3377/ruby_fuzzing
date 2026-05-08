i", x))
    x = proc{binding}.call
    eval "i = 22", x
    assert_equal(22, eval("i", x))
    t = []
    x = proc{binding}.call
    eval "(0..9).each{|i5| t[i5] = proc{i5*2}}", x
    assert_equal(8, t[4].call)
    x = proc{binding}.call
    eval "for i6 in 1..1; j6=i6; end", x
    assert(eval("defined? i6", x))
    assert(eval("defined? j6", x))

    proc {
      p = binding
      eval "foo11 = 1", p
      foo22 = 5
      proc{foo11=22;foo11}.call
      proc{foo22=55}.call
      # assert_equal(eval("foo11