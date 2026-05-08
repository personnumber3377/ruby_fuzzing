do |io|
      buffer = IO::Buffer.new(128)
      buffer.read(io, nil, 6)
      assert_equal "Hello", buffer.get_string(6, 5)
    end