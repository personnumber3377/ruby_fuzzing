do |r|
      assert_equal("foo\n[...]\n", r.read)
    end