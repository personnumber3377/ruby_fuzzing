do |f|
        break f.pid, Integer(f.read) if f
        Process.daemon(false, true)
        puts $$
      end