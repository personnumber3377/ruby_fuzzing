do |io|
        if !io
          puts "fooo"
        else
          assert_equal("fooo\n", io.read)
        end