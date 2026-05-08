do
        begin
          ary << Thread.current.status
          sleep #1
        ensure
          begin
            ary << Thread.current.status
            sleep #2
          ensure
            ary << Thread.current.status
          end