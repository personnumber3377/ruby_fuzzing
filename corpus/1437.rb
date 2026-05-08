do
      {a: {b: 0}} => {a: {bb:}}
      raise bb # suppress "unused variable: bb" warning
    rescue NoMatchingPatternKeyError => e
      assert_equal({b: 0}, e.matchee)
      assert_equal(:bb, e.key)
      raise e
    end