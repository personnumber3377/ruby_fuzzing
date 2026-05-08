do
        Timeout.timeout 2 do
          sleep # Should block forever
        end