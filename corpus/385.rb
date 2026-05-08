do
      system(env, RUBY, '-e', 'exit',  'rlimit_bogus'.to_sym => 123)
    end