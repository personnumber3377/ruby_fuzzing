do |n|
        an = @it.alphanumeric(n)
        assert_match(/\A[0-9a-zA-Z]*\z/, an)
        assert_equal(n, an.length)
      end