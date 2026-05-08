do |tmpdir|
      path = File.join(tmpdir, "foo")

      assert_raise(Errno::ENOENT) {File.new(path)}
      f = File.new(path, "w")
      f.write("FOO\n")
      f.close
      f = File.new(path)
      data = f.read
      f.close
      assert_equal("FOO\n", data)

      f = File.new(path, File::WRONLY)
      f.write("BAR\n")
      f.close
      f = File.new(path, File::RDONLY)
      data = f.read
      f.close
      assert_equal("BAR\n", data)

      data = File.open(path) {|file|
        File.new(file.fileno, mode: File::RDONLY, autoclose: false).read
      }
      assert_equal("BAR\n", data)

      data = File.open(path) {|file|
        File.new(file.fileno, File::RDONLY, autoclose: false).read
      }
      assert_equal("BAR\n", data)
    end