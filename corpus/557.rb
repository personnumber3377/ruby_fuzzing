self", TOPLEVEL_BINDING)
    assert_nothing_raised(NoMethodError, feature6609) do
      main.instance_eval do
        define_method("feature6609_block