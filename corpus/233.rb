do
        v = [0]
        v[0] += raise(bug) rescue 1
        assert_equal([1], v)
      end