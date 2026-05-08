dog."
    buffer = IO::Buffer.for(string)

    assert_equal string.bytes, buffer.each_byte.to_a
    assert_equal string.bytes[3, 5], buffer.each_byte(3, 5).to_a
  end