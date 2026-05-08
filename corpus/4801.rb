dot = -'.'
    IO.pipe do |sig_rd, sig_wr|
      noex = Thread.new do # everything right and never see exceptions :)
        until sig_rd.wait_readable(0)
          IO.pipe do |r, w|
            assert_nil r.timeout
            assert_nil w.timeout

            th = Thread.new { r.read(1) }
            w.write(dot)

            assert_same th, th.join(15), '"good" reader timeout'
            assert_equal(dot, th.value)
          end