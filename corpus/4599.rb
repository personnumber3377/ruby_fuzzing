do |w|
      Thread.pass until f
      w.write("1" * 10000)
      w.close
    end