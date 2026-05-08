do |path|
      File.open(path, 'r') do |file|
        file.read_nonblock(4)
      end