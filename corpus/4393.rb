do |f|
          io.reopen(f)
          Process.wait(f.pid)
          assert_raise(Errno::EPIPE) do
            io.print "foo\n"
          end