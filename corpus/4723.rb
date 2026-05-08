do |r|
      assert_equal("hey\n" * 100, r.read)
    end