dows? # does not support fifo

  def test_execopts_redirect_open_fifo_interrupt_raise
    pid = nil
    with_tmpchdir {|d|
      begin
        File.mkfifo("fifo")
      rescue NotImplementedError
        return
      end