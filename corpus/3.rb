do
      result << "P1"
      condvar.broadcast
      result << "P2"
    end