down state is handled properly by empty? for the non-blocking case
  def test_empty_non_blocking
    q = Thread::SizedQueue.new 3
    3.times{|i| q << i}

    # these all block cos the queue is full
    prod_threads = 4.times.map {|i|
      Thread.new {
        Thread.current.report_on_exception = false
        q << 3+i
      }
    }
    sleep 0.01 until prod_threads.all?{|thr| thr.stop?}

    items = []
    # sometimes empty? is false but pop will raise ThreadError('empty'),
    # meaning a value is not immediately available but will be soon.
    while prod_threads.any?(&:alive?) or !q.empty?
      items << q.pop(true) rescue nil
    end