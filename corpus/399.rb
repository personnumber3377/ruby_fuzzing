do |pipes|
        src = 'p [STDIN,STDOUT,STDERR].map(&:nonblock?)'
        rdr = { 0 => pipes[0][0], 1 => pipes[1][1], 2 => pipes[2][1] }
        pid = spawn(RUBY, '-rio/nonblock', '-e', src, rdr)
        assert_equal("[false, false, false]\n", pipes[1][0].gets)
        Process.wait pid
      end