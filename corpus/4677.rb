do |r|
      e = nil
      assert_warn('') {
        e = r.each_byte
      }
      (%w(f o o) + ["\n"] + %w(b a r) + ["\n"] + %w(b a z) + ["\n"]).each do |c|
        assert_equal(c.ord, e.next)
      end