do |file|
      d, b = File.split(file)
      assert_equal(File.dirname(file), d)
      assert_equal(File.basename(file), b)
    end