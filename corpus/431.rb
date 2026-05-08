do |f|
        break f.read if f
        Process.daemon(false, true)
        puts "ok", Dir.pwd
      end