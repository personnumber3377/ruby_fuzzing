do |path|
        begin
          require path
        rescue RuntimeError => e
          e.message # had confirm belonging issue here
        else
          nil
        end