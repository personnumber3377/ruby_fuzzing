do
      assert_raise(ThreadError) do
        m.unlock
      end