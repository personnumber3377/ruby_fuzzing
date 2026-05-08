does_not_leak_with_invalid_offset
    assert_raise(Errno::EINVAL) { IO.binread(__FILE__, 0, -1) }
  end