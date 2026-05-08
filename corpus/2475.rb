dom_argument_error
    r = Random.new(0)
    assert_raise(ArgumentError) { r.rand(0, 0) }
    assert_raise(ArgumentError, '[ruby-core:24677]') { r.rand(-1) }
    assert_raise(ArgumentError, '[ruby-core:24677]') { r.rand(-1.0) }
    assert_raise(ArgumentError, '[ruby-core:24677]') { r.rand(0) }
    assert_equal(0, r.rand(1), '[ruby-dev:39166]')
    assert_equal(0, r.rand(0...1), '[ruby-dev:39166]')
    assert_equal(0, r.rand(0..0), '[ruby-dev:39166]')
    assert_equal(0.0, r.rand(0.0..0.0), '[ruby-dev:39166]')
    assert_raise(ArgumentError, '[ruby-dev:39166]') { r.rand(0...0) }
    assert_raise(ArgumentError, '[ruby-dev:39166]') { r.rand(0..-1) }
    assert_raise(ArgumentError, '[ruby-dev:39166]') { r.rand(0.0...0.0) }
    assert_raise(ArgumentError, '[ruby-dev:39166]') { r.rand(0.0...-0.1) }
    bug3027 = '[ruby-core:29075]'
    assert_raise(ArgumentError, bug3027) { r.rand(nil) }
  end