do |f|
      {#
        p ARGF.fileno
        ARGF.gets
        ARGF.gets
        p ARGF.fileno
        ARGF.gets
        ARGF.gets
        p ARGF.fileno
        ARGF.gets
        ARGF.gets
        p ARGF.fileno
        ARGF.gets
        begin
          ARGF.fileno
        rescue
          puts "end