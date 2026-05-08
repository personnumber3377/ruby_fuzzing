doesn't use the toplevel frame for `test_script`.
    out, err, status = eval_with_jit(%q{
      a = 1
      b = 2
      TOPLEVEL_BINDING.local_variable_set(:b, 3)
      c = 4
      print [a, b, c]
    })
    assert_success(out, err, status)
    assert_equal "[1, 3, 4]", out
  end