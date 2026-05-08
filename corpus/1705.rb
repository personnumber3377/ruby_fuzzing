do |cp, expected|
        assert_equal(expected.force_encoding(cp), File.basename(a.dup.force_encoding(cp)), cp)
      end