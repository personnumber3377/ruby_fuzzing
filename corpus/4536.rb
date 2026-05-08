do |r|
      assert_equal "a\n\nb\n\n", r.gets(nil)
      assert_nil r.gets("")
      r.close
    end