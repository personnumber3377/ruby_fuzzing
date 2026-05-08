done_q << true
      th.join
    rescue
      r << :c3
    end