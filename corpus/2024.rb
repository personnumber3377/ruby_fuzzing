dows and macOS, file system encoding is always UTF-8.
    def test_home_utf8
      setup_envs

      ENV["HOME"] = "/\u{e4}~\u{1f3e0}"
      assert_equal("/\u{e4}~\u{1f3e0}", Dir.home)
    end