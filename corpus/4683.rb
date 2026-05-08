do |r|
      (%w(f o o) + ["\n"] + %w(b a r) + ["\n"] + %w(b a z) + ["\n"]).each do |c|
        assert_equal(c, r.readchar)
      end