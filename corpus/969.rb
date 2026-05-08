do |qcreate|
      q = qcreate[]
      synq = Thread::Queue.new
      prod_threads = 20.times.map do |i|
        Thread.new {
          synq.pop
          assert_raise(ClosedQueueError) {
            q << i
          }
        }
      end