do |r, w|
      assert_equal 0, w.write, '[ruby-core:86285] [Bug #14338]'
      assert_equal :wait_readable, r.read_nonblock(1, exception: false)
    end