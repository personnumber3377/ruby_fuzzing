do |r|
        assert_equal([line, line, "\n"], r.readlines)
      end