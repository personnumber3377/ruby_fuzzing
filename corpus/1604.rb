do
        assert_equal(:ok, Array.new(100_000, nil).permutation {break :ok})
      end