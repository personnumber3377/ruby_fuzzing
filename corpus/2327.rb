do
        Ractor.new do
          a = A
          100.times do
            a = a.singleton_class
          end