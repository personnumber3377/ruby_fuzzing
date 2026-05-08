do |r|
      assert_equal("a\n\nb\n\n", r.gets(nil, chomp: true), "[Bug #18770]")
      assert_nil r.gets("")
      r.close
    end