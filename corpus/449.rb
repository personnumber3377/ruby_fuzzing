dows?

  def test_clock_gettime
    t1 = Process.clock_gettime(Process::CLOCK_REALTIME, :nanosecond)
    t2 = Time.now; t2 = t2.tv_sec * 1000000000 + t2.tv_nsec
    t3 = Process.clock_gettime(Process::CLOCK_REALTIME, :nanosecond)
    assert_operator(t1, :<=, t2)
    assert_operator(t2, :<=, t3)
    assert_raise_with_message(Errno::EINVAL, /:foo/) do
      Process.clock_gettime(:foo)
    end