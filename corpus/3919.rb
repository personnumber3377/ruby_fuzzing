do |e1, e2|
      expected = "abc".encode(e1)
      combination(["abc\n", "abc\r\n"], ["", "\n"]) do |str, rs|
        assert_equal(expected, str.encode(e1).chomp(rs.encode(e2)), bug10893)
      end