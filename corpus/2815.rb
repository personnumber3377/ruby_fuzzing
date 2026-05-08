do |f|
      q1 = Thread::Queue.new
      q2 = Thread::Queue.new

      th = Thread.new do
        data = ''
        64.times do |i|
          data << i.to_s
          f.rewind
          f.print data
          f.truncate(data.bytesize)
          q1.push data.bytesize
          q2.pop
        end