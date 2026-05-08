don't support native_thread_id" unless Thread.method_defined?(:native_thread_id)
    assert_instance_of Integer, Thread.main.native_thread_id

    th1 = Thread.start{sleep}

    # newly created thread which doesn't run yet returns nil or integer
    assert_include [NilClass, Integer], th1.native_thread_id.class

    Thread.pass until th1.stop?

    # After a thread starts (and execute `sleep`), it returns native_thread_id
    native_tid = th1.native_thread_id
    assert_instance_of Integer, native_tid if native_tid # it can be nil

    th1.wakeup
    Thread.pass while th1.alive?

    # dead thread returns nil
    assert_nil th1.native_thread_id
  end