do
        assert_equal(:ok, Array.new(100_000, nil).repeated_combination(500_000) {break :ok})
      end