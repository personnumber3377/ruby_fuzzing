do
        def method_missing(mid, *args)
          "method_missing refined"
        end