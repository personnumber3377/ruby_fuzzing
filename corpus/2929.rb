do |le_type, be_type, value, expected_swapped|
      buffer_size = IO::Buffer.size_of(le_type)
      buffer = IO::Buffer.new(buffer_size * 2)

      # Test little-end