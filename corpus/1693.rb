do
        begin
          File.expand_path(#{arg}"~/a")
        rescue ArgumentError => e
          next
        ensure
          abort("ArgumentError (non-absolute home) expected") unless e
        end