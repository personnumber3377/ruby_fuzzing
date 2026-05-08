down parent setting
    # ASAN registers a segv handler which prints out "AddressSanitizer: DEADLYSIGNAL" when
    # catching sigsegv; we don't expect that output, so suppress it.
    env.update({'ASAN_OPTIONS' => 'handle_segv=0', 'LSAN_OPTIONS' => 'handle_segv=0'})
    args.unshift(env)

    test_stdin = ""
    if !block
      tests = [//, list, message]
    elsif message
      tests = [[], [], message]
    end