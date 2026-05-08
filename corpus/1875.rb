do
      Thread.pass until a
      x.raise "stop"
    end