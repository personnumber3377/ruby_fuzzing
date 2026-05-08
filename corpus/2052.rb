documented debugging feature doesn't crash
    args = [
      '--yjit-call-threshold=1',
      '--yjit-dump-insns',
      '-e def foo(case:) = {case:}[:case]',
      '-e foo(case:0)',
    ]
    _out, _err, status = invoke_ruby(args, '', true, true)
    assert_not_predicate(status, :signaled?)
  end