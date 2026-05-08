do
        v = 0
        v += raise(bug) rescue 1
        assert_equal(1, v)
      end