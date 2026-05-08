do
      assert_equal(:foobar, eval(':"foo\u{}bar"'))
      assert_equal(:foobar, eval(':"foo\u{ }bar"'))
    end