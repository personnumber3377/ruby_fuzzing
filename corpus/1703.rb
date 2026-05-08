do |file|
        basename = File.basename(file)
        assert_equal(basename, File.basename(file + " "))
        assert_equal(basename, File.basename(file + "."))
        assert_equal(basename, File.basename(file + "::$DATA"))
        basename.chomp!(".test")
        assert_equal(basename, File.basename(file + " ", ".test"))
        assert_equal(basename, File.basename(file + ".", ".test"))
        assert_equal(basename, File.basename(file + "::$DATA", ".test"))
        assert_equal(basename, File.basename(file + " ", ".*"))
        assert_equal(basename, File.basename(file + ".", ".*"))
        assert_equal(basename, File.basename(file + "::$DATA", ".*"))
      end