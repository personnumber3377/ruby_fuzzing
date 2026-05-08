do
      assert_equal(0, fs1 <=> fs1)
      assert_equal(-1, fs1 <=> fs2)
      assert_equal(1, fs2 <=> fs1)
      assert_nil(fs1 <=> nil)
      assert_integer(fs1.dev)
      assert_integer_or_nil(fs1.rdev)
      assert_integer_or_nil(fs1.dev_major)
      assert_integer_or_nil(fs1.dev_minor)
      assert_integer_or_nil(fs1.rdev_major)
      assert_integer_or_nil(fs1.rdev_minor)
      assert_integer(fs1.ino)
      assert_integer(fs1.mode)
      unless /emx|mswin|mingw/ =~ RUBY_PLATFORM
        # on Windows, nlink is always 1. but this behavior will be changed
        # in the future.
        assert_equal(hardlinkfile ? 2 : 1, fs1.nlink)
      end