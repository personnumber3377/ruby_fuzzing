does not match')

    re = /test/
    assert_equal re, re
    assert_equal 'test', re.source
    assert_equal true, !!(re =~ 'test')
    assert_equal false, !!(re =~ 'does not match')

    assert_equal(/x#{1+1}x/, /x#{1+1}x/)
    s = "OK"
    assert_equal(/x#{s}x/, /x#{s}x/)
    assert_equal true, !!(/x#{s}x/ =~ "xOKx")
    assert_equal false, !!(/x#{s}x/ =~ "does not match")

    s = "OK"
    prev = nil
    3.times do
      re = /#{s}/o
      assert_same prev, re if prev
      prev = re
    end