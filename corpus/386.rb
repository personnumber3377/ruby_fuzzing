do
      system(env, RUBY, '-e', 'exit', :rlimit_bogus => 123)
    end