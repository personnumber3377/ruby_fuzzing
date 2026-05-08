do
      until q.closed? && q.empty?
        raise if q.size > q.max
        # otherwise this exercise causes too much contention on the lock
        sleep 0.01
      end