do |f|
        i = 0
        until f.eof?
          assert_equal(str[i], f.read(1), bug6271)
          i += 1
        end