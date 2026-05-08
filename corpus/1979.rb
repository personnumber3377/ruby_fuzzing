does not have a Proc
    ->(&blk) {}.call(&:test_to_proc_call_with_symbol_proc)
    assert_equal(1, first, bug11594)
  end