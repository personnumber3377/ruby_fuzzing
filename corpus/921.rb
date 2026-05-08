do
        result << :begin
        raise "An exception occurred!"
      rescue
        result << :rescue
      else
        result << :else
      ensure
        result << :ensure
      end