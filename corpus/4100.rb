do |f|
        lines.each do |line|
          f.pos
          assert_equal(line, f.readline.chomp, bug6401)
        end