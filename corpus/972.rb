do |qcreate|
      q = qcreate[]
      q.close
      assert_nothing_raised(ClosedQueueError){q.close}
    end