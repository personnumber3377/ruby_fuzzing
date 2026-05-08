do |io|
      buffer = IO::Buffer.new(128)
      buffer.read(io)
      assert_equal "Hello", buffer.get_string(0, 5)
    end