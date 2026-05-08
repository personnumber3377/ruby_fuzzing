do |r|
      assert_equal "aaa:", r.gets(rs)
      assert_equal "bbb", r.gets(rs)
      assert_nil r.gets(rs)
      r.close
    end