do_assign(assign, vars).to_a.sort
    bemu = emu_assign(assign).to_a.sort
    assert_equal(bemu, bruby, sent)
  end