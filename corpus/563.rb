__FILE__", nil, fname, 1))
  end

  def test_eval_invalid_block_exit_bug_20597
    assert_raise(SyntaxError){eval("break if false