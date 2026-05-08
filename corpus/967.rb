do |i|
      thr = Thread.new{q.pop}; thr[:pc] = i; thr
    end