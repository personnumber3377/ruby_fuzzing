EVTEST1", x))	# constant in module
    assert_equal(125, eval("evtest2", x))	# local var in module
    bad = true
    begin
      eval("EVTEST1