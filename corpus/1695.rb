dots_file_name
    bug = "[ruby-talk:18512]"

    assert_equal(File.join(Dir.pwd, ".a"), File.expand_path(".a"), bug)
    assert_equal(File.join(Dir.pwd, "..a"), File.expand_path("..a"), bug)

    if DRIVE
      # cleanup dots only on Windows
      assert_equal(File.join(Dir.pwd, "a"), File.expand_path("a."), bug)
      assert_equal(File.join(Dir.pwd, "a"), File.expand_path("a.."), bug)
    else
      assert_equal(File.join(Dir.pwd, "a."), File.expand_path("a."), bug)
      assert_equal(File.join(Dir.pwd, "a.."), File.expand_path("a.."), bug)
    end