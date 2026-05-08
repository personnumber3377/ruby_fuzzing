dopen(fd, autoclose = true, level = 50)
    if level > 0
      begin
        1.times {return try_fdopen(fd, autoclose, level - 1)}
      ensure
        GC.start
      end