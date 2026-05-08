do_block_in_lambda
    bug11107 = '[ruby-core:69017] [Bug #11107]'
    assert_valid_syntax('p ->() do a() do end