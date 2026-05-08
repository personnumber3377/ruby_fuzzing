do |src|
      assert_valid_syntax(src)
      assert_equal(1, eval(src), src)
    end