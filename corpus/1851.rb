do
      flag = true
      while flag
        flag = false
        begin
          next
        rescue
          assert(false)
        ensure
          raise string
        end