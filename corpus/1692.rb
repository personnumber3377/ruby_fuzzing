do |cp, expected|
      assert_equal(expected.force_encoding(cp), File.expand_path(a.dup.force_encoding(cp)), cp)
    end