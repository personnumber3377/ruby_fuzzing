do
      Proc.new{yield}.isolate
    end