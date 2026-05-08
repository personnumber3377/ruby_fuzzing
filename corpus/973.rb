do not start running too soon and complete before we check status
    mutex = Mutex.new
    mutex.lock

    producers = count_producers.times.map do
      Thread.new do
        mutex.lock
        mutex.unlock
        count_items.times{|i| q << [i,"#{i} for #{Thread.current.inspect}"]}
      end