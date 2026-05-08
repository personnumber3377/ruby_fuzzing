do |i|
      thrs << Thread.new { m.synchronize { Process.waitpid2(fork{})[1] } }
    end