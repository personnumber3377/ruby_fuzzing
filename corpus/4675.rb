do |r|
      assert_equal(["fo", "o\n"], r.each_line(nil, 2, chomp: true).to_a, "[Bug #18770]")
    end