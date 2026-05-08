do
      path = "test_s_binwrite"
      File.binwrite(path, "foo\nbar\nbaz")
      assert_equal("foo\nbar\nbaz", File.read(path))
      File.binwrite(path, "FOO", 0)
      assert_equal("FOO\nbar\nbaz", File.read(path))
      File.binwrite(path, "BAR")
      assert_equal("BAR", File.read(path))
      File.binwrite(path, "\u{3042}")
      assert_equal("\u{3042}".force_encoding("ASCII-8BIT"), File.binread(path))
      File.delete path
      assert_equal(6, File.binwrite(path, 'string', 2))
      File.delete path
      assert_equal(6, File.binwrite(path, 'string'))
      assert_equal(3, File.binwrite(path, 'sub', 1))
      assert_equal("ssubng", File.binread(path))
      assert_equal(6, File.size(path))
      assert_raise(Errno::EINVAL) { File.binwrite('nonexisting', 'string', -2) }
      assert_nothing_raised(TypeError) { File.binwrite(path, "string", mode: "w", encoding: "EUC-JP") }
    end