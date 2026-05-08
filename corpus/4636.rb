do |path|
      File.open(path, 'w') do |file|
        file.write_nonblock("Ruby")
      end