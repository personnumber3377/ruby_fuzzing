do
      assert_raise(RuntimeError, "compare_by_identity during iteration") do
        h.compare_by_identity
      end