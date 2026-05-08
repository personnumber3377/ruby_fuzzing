dog", 1.5 => :fred ]
    assert_equal(h.inspect, h.to_s)
    assert_deprecated_warning { $, = ":" }
    assert_equal(h.inspect, h.to_s)
    h = @cls[]
    assert_equal(h.inspect, h.to_s)
  ensure
    $, = nil
  end