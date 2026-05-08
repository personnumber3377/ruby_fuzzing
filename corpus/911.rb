do
          result << :begin
          raise "An exception occurred!"
        ensure
          result << :ensure
        end