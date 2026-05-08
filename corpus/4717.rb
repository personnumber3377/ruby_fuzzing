do |r|
      assert_equal("a\n", r.gets)
      assert_equal("a:b:c\n", r.gets)
      assert_nil r.gets
      r.close
    end