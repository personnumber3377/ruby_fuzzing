do |f|
      {#
        begin
          8.times do
            p ARGF.eof?
            ARGF.gets
          end