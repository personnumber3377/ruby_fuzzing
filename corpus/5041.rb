do |f|
      {#
        begin
          ARGF.binmode
          loop do
            p ARGF.tell
            p ARGF.gets
          end