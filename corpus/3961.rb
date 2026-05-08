do
      1.times do
        foo = [1,2,3].to_enum
        GC.start
        foo
      end