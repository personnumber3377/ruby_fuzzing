do |file|
      assert_equal(3, File.open(file) {|f| f.size })
      File.open(file, "a") do |f|
        f.write("bar")
        assert_equal(6, f.size)
      end