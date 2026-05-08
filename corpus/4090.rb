do |in_r, in_w|
      with_pipe do |out_r, out_w|
        pid = Process.spawn({}, EnvUtil.rubybin, '-e', <<-'End', in: in_r, out: out_w)
          STDOUT.binmode
          STDOUT.write STDIN.getc
          STDOUT.write STDIN.getc
          STDIN.binmode
          STDOUT.write STDIN.getc
          STDOUT.write STDIN.getc
          STDOUT.write STDIN.getc
          STDOUT.write STDIN.getc
          STDOUT.write STDIN.getc
          STDOUT.write STDIN.getc
          STDOUT.write STDIN.getc
        End
        in_r.close
        out_w.close
        src = "a\r\nb\r\nc\r\n"
        in_w.binmode.write src
        in_w.close
        Process.wait pid
        assert_equal "a\nb\r\nc\r\n", out_r.binmode.read
        out_r.close
      end