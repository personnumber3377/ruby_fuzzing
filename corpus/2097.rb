__dir__", binding, file, line), bug8436)
    bug8662 = '[ruby-core:56099] [Bug #8662]'
    assert_equal("arbitrary", eval("__dir__", binding, "arbitrary/file.rb