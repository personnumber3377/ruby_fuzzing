downto
    a = []
    assert_equal(-1, -1.downto(-3) {|x| a << x })
    assert_equal([-1, -2, -3], a)

    a = []
    assert_equal(1, 1.downto(2) {|x| a << x })
    assert_equal([], a)

    y = -(2**30)
    a = []
    assert_equal(y, y.downto(y-2) {|x| a << x })
    assert_equal([y, y-1, y-2], a)
  end