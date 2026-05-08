dotted_prefix
    Dir.mktmpdir do |dir|
      prefix = File.join(dir, "...a")
      Dir.mkdir(prefix)
      assert_file.exist?(prefix)

      assert_nothing_raised { File.stat(prefix) }

      Dir.chdir(dir) do
        assert_nothing_raised { File.stat(File.basename(prefix)) }
      end