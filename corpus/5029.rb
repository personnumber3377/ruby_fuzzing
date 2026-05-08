do |r, e|
      {#
        ARGF.inplace_mode = '/\\\\:'
        while line = ARGF.gets
          puts line.chomp + '.new'
        end