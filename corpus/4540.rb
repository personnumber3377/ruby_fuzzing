do |r|
      assert_equal "a\n\n", r.gets(""), "[ruby-core:03771]"
      assert_equal "b\n\n", r.gets("")
      assert_nil r.gets("")
      r.close
    end