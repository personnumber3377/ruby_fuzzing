do
        Ractor.new do
          20_000.times do
            Object.new.singleton_class
          end