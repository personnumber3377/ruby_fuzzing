dosish
    with_tmpdir {
      open("a", "w") {|f| f.write "\n"}
      assert_equal("\r\n", IO.binread("a"))
    }
  end