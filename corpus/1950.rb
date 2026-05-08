do
        str = "\u{3042}" * n
        m = Regexp.new("(.)" * n).match(str)
        assert_not_nil(m)
        assert_equal([n - 1, n], m.offset(n))
        m.inspect
      end