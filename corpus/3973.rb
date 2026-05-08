do |i, o|
      i.timeout = 0.0001

      assert_raise(IO::TimeoutError) {i.read}
    end