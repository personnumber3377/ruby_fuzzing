do
        begin
          raise bug
        rescue Bug
          i += 1
        end