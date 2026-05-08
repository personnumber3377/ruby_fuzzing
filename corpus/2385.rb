dosish
      assert_equal("//127.0.0.1/share", File.expand_path("/", "//127.0.0.1/share/sub"))
      assert_equal("//127.0.0.1/share/dir", File.expand_path("/dir", "//127.0.0.1/share/sub"))
      assert_equal("z:/", File.expand_path("/", "z:/sub"))
      assert_equal("z:/dir", File.expand_path("/dir", "z:/sub"))
    end