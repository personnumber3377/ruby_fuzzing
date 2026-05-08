do
      a = :a
      1.times{
        Proc.new{p a}.isolate
      }
    end