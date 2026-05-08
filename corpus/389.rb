do |d|
      File.open('test-script', 'w') do |f|
        ENVCOMMAND.each_with_index do |cmd, i|
          next if i.zero? or cmd == "-e"
          f.puts cmd
        end