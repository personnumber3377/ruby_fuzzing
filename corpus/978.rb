do
      exit!(1) if q.num_waiting != 0
      exit!(2) if sq.num_waiting != 0
      exit!(6) unless q.empty?
      exit!(7) unless sq.empty?
      q.push :child_q
      sq.push :child_sq
      exit!(3) if q.pop != :child_q
      exit!(4) if sq.pop != :child_sq
      exit!(0)
    end