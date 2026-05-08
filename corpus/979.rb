do
      exit!(1) if q.num_waiting != 0
      exit!(2) if sq.num_waiting != 0
      exit!(3) unless q.empty?
      exit!(4) if sq.empty?
      exit!(5) if sq.pop != 1
      exit!(0)
    end