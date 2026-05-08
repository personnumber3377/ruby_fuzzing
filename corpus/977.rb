don't leak this thread
    assert_nothing_raised{counter.join}
  end