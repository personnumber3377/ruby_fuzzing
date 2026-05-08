do |r|
      assert_equal(["foo\n"], r.each_line(nil, chomp: true).to_a, "[Bug #18770]")
    end