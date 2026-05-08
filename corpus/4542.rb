do |r|
      assert_equal "aaa", r.gets(rs, chomp: true)
      assert_equal "bbb", r.gets(rs, chomp: true)
      assert_nil r.gets(rs, chomp: true)
      r.close
    end