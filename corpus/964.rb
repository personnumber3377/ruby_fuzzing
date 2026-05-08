do the comparison
    expected_values = [-1] * (num_threads - num_items) + num_items.times.to_a
    assert_equal expected_values, threads.map{|thr| thr.value || -1 }.sort
  end