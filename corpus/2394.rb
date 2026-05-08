do |r, e|
      assert_equal(
        [ '[true, true, true]', 'foo',
          '[true, true, true]', 'bar',
          '[true, true, true]', 'baz' ], r)
      assert_equal([], e)
    end