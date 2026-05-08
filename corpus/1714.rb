do |file|
      assert_equal(0, File.truncate(file, 1))
      assert_file.exist?(file)
      assert_equal(1, File.size(file))
      assert_equal(0, File.truncate(file, 0))
      assert_file.exist?(file)
      assert_file.zero?(file)
      make_file("foo", file)
      assert_raise(Errno::ENOENT) { File.truncate(nofile, 0) }

      f = File.new(file, "w")
      assert_equal(0, f.truncate(2))
      assert_file.exist?(file)
      assert_equal(2, File.size(file))
      assert_equal(0, f.truncate(0))
      assert_file.exist?(file)
      assert_file.zero?(file)
      f.close
      make_file("foo", file)

      assert_raise(IOError) { File.open(file) {|ff| ff.truncate(0)} }
    end