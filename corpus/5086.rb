do |f|
      {#
        $stdout.sync = true
        :wait_readable == ARGF.read_nonblock(1, +"", exception: false) or
          abort "did not return :wait_readable"

        begin
          ARGF.read_nonblock(1)
          abort 'fail to raise IO::WaitReadable'
        rescue IO::WaitReadable
        end