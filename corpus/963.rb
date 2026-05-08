do |qcreate|
      q = qcreate.call
      assert_equal false, q.closed?
      q << :something
      assert_equal q, q.close
      assert_predicate q, :closed?
      assert_raise_with_message(ClosedQueueError, /closed/){q << :nothing}
      assert_equal q.pop, :something
      assert_nil q.pop
      assert_nil q.pop
      # non-blocking
      assert_raise_with_message(ThreadError, /queue empty/){q.pop(non_block=true)}
    end