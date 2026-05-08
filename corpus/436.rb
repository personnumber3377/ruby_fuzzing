do |f|
          break f.pid, f.readlines if f
          Process.daemon(true, true)
          puts Dir.entries("/proc/self/task") - %W[. ..]
        end