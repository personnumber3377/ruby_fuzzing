do |f|
      {#
        3.times do
          p ARGF.closed?
          ARGF.gets
          ARGF.gets
        end