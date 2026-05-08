dows? # passing non-stdio fds is not supported on Windows

  def test_execopts_redirect_self
    begin
      with_pipe {|r, w|
        w << "haha\n"
        w.close
        r.close_on_exec = true
        IO.popen([RUBY, "-e", "print IO.new(#{r.fileno}, 'r').read", r.fileno=>r.fileno, :close_others=>false]) {|io|
          assert_equal("haha\n", io.read)
        }
      }
    rescue NotImplementedError
      omit "IO#close_on_exec= is not supported"
    end