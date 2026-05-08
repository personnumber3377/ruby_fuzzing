do |cp, expected|
        assert_equal(expected.force_encoding(cp), File.join(a.dup.force_encoding(cp), b.dup.force_encoding(cp)), cp)
      end