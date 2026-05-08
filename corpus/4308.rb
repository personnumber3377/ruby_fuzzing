don't run if killed by rb_thread_terminate_all
  ensure
    puts "#{mth.alive?} #{mth.status} #{Thread.current.status}"
  end