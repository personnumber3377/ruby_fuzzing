donly
    buffer = IO::Buffer.new(128, IO::Buffer::INTERNAL|IO::Buffer::READONLY)
    assert_predicate buffer, :readonly?

    assert_raise IO::Buffer::AccessError do
      buffer.set_string("")
    end