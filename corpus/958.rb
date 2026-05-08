do |th|
      if th and th.alive?
        th.wakeup
        th.join
      end