downup_to
    assert_equal 0, 1.upto(-100).size
    assert_equal 102, 1.downto(-100).size
    assert_equal Float::INFINITY, 42.upto(Float::INFINITY).size
  end