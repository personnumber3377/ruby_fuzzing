nil", binding())
    assert_equal true,  eval("true", binding())
    assert_equal false, eval("false", binding())
    assert_equal self,  eval("self", binding())
    assert_equal 1,     eval("1", binding())
    assert_equal :sym,  eval(":sym", binding())

    assert_equal 11,    eval("11", binding())
    @ivar = 12
    assert_equal 12,    eval("@ivar", binding())
    assert_equal 13,    eval("@@cvar", binding())
    assert_equal 14,    eval("$gvar__eval", binding())
    assert_equal 15,    eval("Const", binding())

    assert_equal 16,    eval("7 + 9", binding())
    assert_equal 17,    eval("17.to_i", binding())
    assert_equal "18",  eval(%q("18