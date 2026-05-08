", 1) }
  end

  def test_eval_raise
    assert_raise(RuntimeError) { eval("raise ''