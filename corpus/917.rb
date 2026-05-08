do
          result << :begin
        rescue
          result << :rescue
        else
          result << :else
        ensure
          result << :ensure
        end