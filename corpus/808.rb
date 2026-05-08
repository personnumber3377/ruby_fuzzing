do_block_after_lambda
    bug11380 = '[ruby-core:70067] [Bug #11380]'
    assert_valid_syntax('p -> { :hello }, a: 1 do end