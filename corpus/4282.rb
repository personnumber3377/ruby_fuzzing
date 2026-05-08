do
      Thread.pass while ok
      t1.join(0.01)
    end