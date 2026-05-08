do
      stdout, $stdout = $stdout, capture
      puts "hey"
    ensure
      $stdout = stdout
    end