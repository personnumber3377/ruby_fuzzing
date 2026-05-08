do |file|
      assert_equal(1, File.lchmod(0444, file))
      assert_equal(0444, File.stat(file).mode % 01000)
      File.lchmod(0600, regular_file)
    end