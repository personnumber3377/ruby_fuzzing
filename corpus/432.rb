do |f|
        break f.read if f
        Process.daemon(true, true)
        puts "ok", Dir.pwd
      end