donly
    hello = %w"Hello World".join(" ").freeze
    buffer = IO::Buffer.for(hello)
    slice = buffer.slice
    assert_predicate slice, :readonly?
    assert_raise IO::Buffer::AccessError do
      # This breaks the literal in string pool and many other tests in this file.
      slice.set_string("Adios", 0, 5)
    end