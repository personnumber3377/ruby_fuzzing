do
      assert_nothing_raised(TypeError, ArgumentError, Bug8795) do
        t1 = Marshal.load(data + "T")
        t2 = Marshal.load(data + "\"\x0ebadoffset")
      end