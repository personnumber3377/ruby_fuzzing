do
      if search <= from
        assert_include yielded, from
        assert_equal from, r
      end