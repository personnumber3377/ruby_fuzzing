do |r, w|
      r.close_read
      assert_raise(Errno::EPIPE) { w.write "foobarbaz" }
      assert_nothing_raised(IOError) {r.close_read}
      assert_nothing_raised(IOError) {r.close}
      assert_nothing_raised(IOError) {r.close_read}
    end