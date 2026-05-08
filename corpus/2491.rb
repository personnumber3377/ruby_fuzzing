dom.new(0)
    r.freeze
    assert_raise(FrozenError, '[Bug #6540]') do
      r.__send