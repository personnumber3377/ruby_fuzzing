do |enc|
      test_start = all_bytes
      assert_equal(test_start, test_start.encode('UTF-8',enc).encode(enc).force_encoding('ASCII-8BIT'))
    end