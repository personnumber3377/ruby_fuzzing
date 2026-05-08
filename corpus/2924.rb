do |file|
      file.write("Hello World")

      buffer = IO::Buffer.map(file, nil, 0, IO::Buffer::PRIVATE)
      begin
        assert_predicate buffer, :private?
        refute_predicate buffer, :readonly?

        buffer.set_string("J")

        # It was not changed because the mapping was private:
        file.seek(0)
        assert_equal "Hello World", file.read
      ensure
        buffer&.free
      end