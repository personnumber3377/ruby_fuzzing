do |file|
      io = open(file) {|f| f}
      assert_raise(IOError) {
        File.identical?(file, io)
      }
      File.unlink(file)
      assert_file.not_exist?(file)
    end