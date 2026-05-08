dowing_block_local_variables
    bug9486 = '[ruby-core:60501] [Bug #9486]'
    assert_equal([:x, :bug9486], tap {|;x| x = x; break local_variables}, bug9486)
  end