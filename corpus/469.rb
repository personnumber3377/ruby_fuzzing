do
      Thread.current.raise(RuntimeError, "Queued error")

      assert_predicate Thread, :pend