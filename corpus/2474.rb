dom_type_error
    assert_raise(TypeError) { Random.new(Object.new) }
    assert_raise(TypeError) { Random.new(0).rand(Object.new) }
  end