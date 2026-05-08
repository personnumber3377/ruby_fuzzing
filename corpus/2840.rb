dows and non-Windows
      assert_include(["a\r\nb\r\n", "a\nb\n"], test.(:crlf))
      assert_equal("a\r\nb\r\n", test.(:cr))

      File.binwrite(path, "a\rb\r")
      assert_equal("a\rb\r", test.(:lf))
      assert_equal("a\nb\n", test.(:universal))
      assert_equal("a\rb\r", test.(:crlf))
      assert_equal("a\rb\r", test.(:cr))
    end