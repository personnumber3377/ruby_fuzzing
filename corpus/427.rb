dows?
    exs << Errno::E2BIG if defined?(Errno::E2BIG)
    opts = {[STDOUT, STDERR]=>File::NULL}
    if defined?(Process::RLIMIT_NPROC)
      opts[:rlimit_nproc] = /openbsd/i =~ RUBY_PLATFORM ? 64 : 128
    end