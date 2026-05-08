do |r,w|
      th = Thread.new {r.sysread(100, buf)}

      Thread.pass until th.stop?

      assert_equal 100, buf.bytesize

      msg = /can't modify string; temporarily locked/
      assert_raise_with_message(RuntimeError, msg) do
        buf.replace("")
      end