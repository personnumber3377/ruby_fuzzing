dog canine )]
    a3 = @cls[*%w( mule asinine )]

    a = @cls[ a1, a2, a3, a4 ]

    assert_equal(a1, a.assoc('cat'))
    assert_equal(a3, a.assoc('mule'))
    assert_equal(%w( pork porcine ), a.assoc("pork"))
    assert_equal(nil, a.assoc('asinine'))
    assert_equal(nil, a.assoc('wombat'))
    assert_equal(nil, a.assoc(1..2))
  end