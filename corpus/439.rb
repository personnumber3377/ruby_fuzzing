dows?

    assert_nothing_raised { system(*TRUECOMMAND, :new_pgroup=>true) }
    assert_nothing_raised { system(*TRUECOMMAND, :new_pgroup=>false) }
    assert_nothing_raised { spawn(*TRUECOMMAND, :new_pgroup=>true) }
    assert_nothing_raised { IO.popen([*TRUECOMMAND, :new_pgroup=>true]) {} }
  end