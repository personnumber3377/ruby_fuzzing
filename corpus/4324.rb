do |pipe|
      if pipe
        # parent
        child_lines = pipe.read.lines
      else
        # child
        puts Thread.main.native_thread_id
        puts gettid
      end