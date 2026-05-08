do |file|
        basename = File.basename(file)
        assert_equal(basename + " ", File.basename(file + " "))
        assert_equal(basename + ".", File.basename(file + "."))
        assert_equal(basename + "::$DATA", File.basename(file + "::$DATA"))
        assert_equal(basename + " ", File.basename(file + " ", ".test"))
        assert_equal(basename + ".", File.basename(file + ".", ".test"))
        assert_equal(basename + "::$DATA", File.basename(file + "::$DATA", ".test"))
        assert_equal(basename, File.basename(file + ".", ".*"))
        basename.chomp!(".test")
        assert_equal(basename, File.basename(file + " ", ".*"))
        assert_equal(basename, File.basename(file + "::$DATA", ".*"))
      end