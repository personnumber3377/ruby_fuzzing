do |r|
      assert_equal("", r.gets(0))
      assert_equal("foobarbaz", r.gets(9))
    end