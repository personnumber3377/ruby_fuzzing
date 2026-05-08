do
      [
        assert_equal(0, it),
        assert_equal([:a], eval('[:a].map{it}')),
        assert_raise(NameError) {eval('it')},
      ]
    end