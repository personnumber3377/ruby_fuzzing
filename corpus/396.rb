dows? # passing non-stdio fds is not supported on Windows

  def test_execopts_redirect_open_fifo
    with_tmpchdir {|d|
      begin
        File.mkfifo("fifo")
      rescue NotImplementedError
        return
      end