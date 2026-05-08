do
      nr_threads.times do |i|
        threads[i].join
      end