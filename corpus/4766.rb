do |r,w|
      fd = r.fileno
      assert_equal(fd, r.freeze.fileno, bug9865)
    end