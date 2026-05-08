do |file|
      assert_file.identical?(file, file)
      assert_file.not_identical?(file, zerofile)
      assert_file.not_identical?(file, nofile)
      assert_file.not_identical?(nofile, file)
    end