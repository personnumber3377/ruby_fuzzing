dout_filter: reduce)
      queue = []
      50.times do
        10_000.times do
          queue << lambda{}
        end