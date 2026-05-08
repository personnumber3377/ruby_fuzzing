do |_, o, e, i|
      [o.read, e.read, Process.waitpid2(i)]
    end