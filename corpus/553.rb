nil.instance_eval \"binding\"", nil.test_binding)
    assert_raise(NameError, "[ruby-dev:24103]