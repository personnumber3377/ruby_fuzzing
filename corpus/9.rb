do
      assert_raise(ThreadError) {condvar.wait(mutex)}
    end