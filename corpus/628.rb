do
        begin
          1.0/2.0
        rescue SystemStackError => e
          raise SystemStackError, e.message
        end