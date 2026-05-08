do |file|
      assert_equal(file, File.open(file) {|f| f.path})
      assert_equal(file, File.path(file))
      o = Struct.new(:to_path).new(file)
      assert_equal(file, File.path(o))
      o = Struct.new(:to_str).new(file)
      assert_equal(file, File.path(o))
    end