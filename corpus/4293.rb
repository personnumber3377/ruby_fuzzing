do
      assert_raise(ThreadError) do
        m.synchronize do
          assert(false)
        end