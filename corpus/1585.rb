dog cat bee ant )]
    assert_equal(@cls[*%w(ant bee cat dog)], a.reverse)
    assert_equal(@cls[*%w(dog cat bee ant)], a)
    assert_equal(@cls[], @cls[].reverse)
  end