don't deadlock when
    # the child ruby blocks writing the stats to fd 3
    stats = ''
    stats_reader = Thread.new do
      stats = stats_r.read
      stats_r.close
    end