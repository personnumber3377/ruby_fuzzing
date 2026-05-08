do |a, type|
      q = Thread::Queue.new(a.new([1,2,3]))
      assert_equal(3, q.size, type)
      assert_not_predicate(q, :empty?, type)
      assert_equal(1, q.pop, type)
      assert_equal(2, q.pop, type)
      assert_equal(3, q.pop, type)
      assert_predicate(q, :empty?, type)
    end