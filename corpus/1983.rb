downcase)
    assert_equal(:Foo, :foo.capitalize)
    assert_equal(:fOo, :FoO.swapcase)
  end