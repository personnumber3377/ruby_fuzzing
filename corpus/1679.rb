do |file|
      open(file) {|f|
        assert_file.identical?(f, f)
        assert_file.identical?(file, f)
        assert_file.identical?(f, file)
      }
    end