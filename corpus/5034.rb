do inplace edit for stdio/)
    {#
      ARGF.inplace_mode = '.bak'
      while line = ARGF.gets
        puts line.chomp + '.new'
      end