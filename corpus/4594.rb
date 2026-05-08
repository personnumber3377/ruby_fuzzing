do |r|
      assert_equal("a", r.read(1))
      sio = StringIO.new
      IO.copy_stream(r, sio)
      assert_equal("bcd", sio.string)
    end