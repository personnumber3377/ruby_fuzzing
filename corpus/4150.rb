double)*4 + 1
    expected_total_size += alignment_padding(expected_total_size, LONG_LONG_ALIGNMENT)
    expected_total_size += sizeof("long long")
    assert_equal(expected_total_size, total_size)

    expected_result = [
      {format: 'c', native_size_p: false, end