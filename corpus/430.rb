do |f|
        break f.read if f
        Process.daemon
        puts "ng"
      end