do |thr|
      assert_raise(ClosedQueueError){ thr.value }
    end