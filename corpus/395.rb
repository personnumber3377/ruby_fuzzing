dows? # passing non-stdio fds is not supported on Windows

  def test_execopts_redirect_open_order_reverse
    minfd = 3
    maxfd = 20
    with_tmpchdir {|d|
      opts = {}
      maxfd.downto(minfd) {|fd| opts[fd] = ["out#{fd}", "w"] }
      system RUBY, "-e", "#{minfd}.upto(#{maxfd}) {|fd| IO.new(fd).print fd.to_s }", opts
      minfd.upto(maxfd) {|fd| assert_equal(fd.to_s, File.read("out#{fd}")) }
    }
  end