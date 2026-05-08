do |r|
      assert_equal "aaa\n", r.gets
      assert_equal "bbb\n", r.gets
      assert_nil r.gets
      r.close
    end