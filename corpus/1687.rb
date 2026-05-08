do |dir|
      Dir.chdir(dir) do
        path = "foo\u{30b3 30d4 30fc}"
        File.write(path, "") rescue next
        assert_equal(1, File.utime(nil, nil, path))
      end