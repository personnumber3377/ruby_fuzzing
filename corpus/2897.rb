do |buffer|
      assert_raise IO::Buffer::AccessError, "Buffer is not writable!" do
        buffer.set_string("abc")
      end