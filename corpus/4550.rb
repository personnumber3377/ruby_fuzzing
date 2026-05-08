do |r|
      assert_equal "a", r.gets("", chomp: true)
      assert_equal "b", r.gets("", chomp: true)
      assert_nil r.gets("", chomp: true)
      r.close
    end