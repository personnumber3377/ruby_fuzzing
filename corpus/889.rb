do_block_in_hash_brace
    bug13073 = '[ruby-core:78837] [Bug #13073]'
    assert_valid_syntax 'p :foo, {a: proc do end