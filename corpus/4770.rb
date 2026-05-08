don't know if other platforms have a real posix_fadvise()
    with_pipe do |r,w|
      # Linux 2.6.15 and earlier returned EINVAL instead of ESPIPE
      assert_raise(Errno::ESPIPE, Errno::EINVAL) {
        r.advise(:willneed) or omit "fadvise(2) is not implemented"
      }
      assert_raise(Errno::ESPIPE, Errno::EINVAL) {
        w.advise(:willneed) or omit "fadvise(2) is not implemented"
      }
    end