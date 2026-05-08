do |file|
        assert_equal(file, File.expand_path(file + " "))
        assert_equal(file, File.expand_path(file + "."))
        assert_equal(file, File.expand_path(file + "::$DATA"))
      end