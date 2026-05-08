do
      {a: 0} => {aa:}
      raise aa # suppress "unused variable: aa" warning
    rescue NoMatchingPatternKeyError => e
      assert_equal({a: 0}, e.matchee)
      assert_equal(:aa, e.key)
      raise e
    end