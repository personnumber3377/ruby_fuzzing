down
  def sized_queue_size_close
    q = Thread::SizedQueue.new 4
    4.times{|i| q << i}
    Thread.new{ q << 5 }
    Thread.new{ q << 6 }
    assert_equal 4, q.size
    assert_equal 4, q.items
    q.close
    assert_equal 6, q.size
    assert_equal 4, q.items
  end