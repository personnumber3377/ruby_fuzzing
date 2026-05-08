dows-31J"], [])
    assert_in_out_err([env, '-KS', line], "", ["Windows-31J"], [])
    assert_in_out_err([env, '-Ku', line], "", ["UTF-8"], [])
    assert_in_out_err([env, '-KU', line], "", ["UTF-8"], [])
    assert_in_out_err([env, '-Kn', line], "", ["ASCII-8BIT"], [])
    assert_in_out_err([env, '-KN', line], "", ["ASCII-8BIT"], [])
    assert_in_out_err([env, '-wKe', line], "", ["EUC-JP"], /-K/)
  end