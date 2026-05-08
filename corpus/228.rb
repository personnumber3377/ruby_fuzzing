dowing_variable_warning
    assert_no_warning(/shadowing outer local variable/) {eval("a=1; tap {|a|}")}
  end