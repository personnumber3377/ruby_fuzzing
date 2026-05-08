dog  canine )]
    a3 = @cls[*%w( mule asinine )]
    a  = @cls[ a1, a2, a3, a4 ]

    assert_equal(a1,  a.rassoc('feline'))
    assert_equal(a3,  a.rassoc('asinine'))
    assert_equal(%w( pork porcine ), a.rassoc("porcine"))
    assert_equal(nil, a.rassoc('dog'))
    assert_equal(nil, a.rassoc('mule'))
    assert_equal(nil, a.rassoc(1..2))
  end