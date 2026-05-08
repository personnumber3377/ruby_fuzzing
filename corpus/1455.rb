do
      assert_equal(:ok, foo(1_000_000), bug16161)
    end