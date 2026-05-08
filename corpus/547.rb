local1", x)) # normal local var
    assert_equal("local2", eval("local2", x)) # nested local var
    bad = true
    begin
      p eval("local1