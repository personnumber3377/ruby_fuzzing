do |file|
      assert_equal(1, File.chmod(0444, file))
      assert_equal(0444, File.stat(file).mode % 01000)
      assert_equal(0, File.open(file) {|f| f.chmod(0222)})
      assert_equal(0222, File.stat(file).mode % 01000)
      File.chmod(0600, file)
    end