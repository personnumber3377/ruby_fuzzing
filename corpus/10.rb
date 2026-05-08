do
      assert_raise(ThreadError) {condvar.wait(mutex, 0.1)}
    end