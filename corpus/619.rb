down
    assert_equal(12.0, 12.5.round(half: :down))
    assert_equal(13.0, 13.5.round(half: :down))

    assert_equal(2.1, 2.15.round(1, half: :down))
    assert_equal(2.2, 2.25.round(1, half: :down))
    assert_equal(2.3, 2.35.round(1, half: :down))

    assert_equal(-2.1, -2.15.round(1, half: :down))
    assert_equal(-2.2, -2.25.round(1, half: :down))
    assert_equal(-2.3, -2.35.round(1, half: :down))

    assert_equal(7.1364, 7.13645.round(4, half: :down))
    assert_equal(7.1365, 7.1364501.round(4, half: :down))
    assert_equal(7.1364, 7.1364499.round(4, half: :down))

    assert_equal(-7.1364, -7.13645.round(4, half: :down))
    assert_equal(-7.1365, -7.1364501.round(4, half: :down))
    assert_equal(-7.1364, -7.1364499.round(4, half: :down))
  end