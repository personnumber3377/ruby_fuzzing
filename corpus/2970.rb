do
      a = :a
      Proc.new{p a}.isolate
    end