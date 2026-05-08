do |r|
      assert_equal "aaa", r.gets(chomp: true)
      assert_equal "bbb", r.gets(chomp: true)
      assert_equal "ccc", r.gets(chomp: true)
      assert_nil r.gets
      r.close
    end