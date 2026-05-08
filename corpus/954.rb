do
      Thread.new do
        npush.times { q.push(true) }
      end