do inplace edit for stdio; skipping/)
    {#
      ARGF.inplace_mode = '.bak'
      f = ARGF.dup
      while line = f.gets
        puts line.chomp + '.new'
      end