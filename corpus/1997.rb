do
      q.pop
      Dir.chdir(pwd){} rescue $!
    end