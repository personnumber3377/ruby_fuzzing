do |io|
        if !io
          STDERR.reopen(STDOUT)
          raise "fooo"
        else
          assert_empty io.read
        end