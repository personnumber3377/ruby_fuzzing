dog' ]
    a2 = @cls[ 'cat', 'dog' ]
    a3 = @cls[ 'dog', 'cat' ]
    assert_equal(a1.hash, a2.hash)
    assert_not_equal(a1.hash, a3.hash)
    bug9231 = '[ruby-core:58993] [Bug #9231]'
    assert_not_equal(false.hash, @cls[].hash, bug9231)
  end