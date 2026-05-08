do |io|
      buffer = IO::Buffer.new(1024)
      # Only read 24 bytes from the file, as we are starting at offset 1000 in the buffer.
      assert_equal 24, buffer.read(io, 0, 1000)
      assert_equal "Hello World", buffer.get_string(1000, 11)
    end