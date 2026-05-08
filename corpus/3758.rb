do
          x = Thread.current
          Thread.start {
            sleep 0.00001
            x.raise Error.new
          }
          load path
        end