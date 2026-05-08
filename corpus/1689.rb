do |file|
      assert_equal(0, File.rename(file, nofile))
      assert_file.not_exist?(file)
      assert_file.exist?(nofile)
      assert_equal(0, File.rename(nofile, file))
      assert_raise(Errno::ENOENT) { File.rename(nofile, file) }
    end