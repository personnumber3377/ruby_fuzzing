dowing_private_local_variable
    assert_equal 1, eval("_ = 1; [[2]].each{ |(_)| }; _")
  end