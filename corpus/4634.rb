do |r|
      assert_empty(r.read_nonblock(0, s = "01234567"))
      assert_empty(s)
    end