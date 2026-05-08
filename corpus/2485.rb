do
      (1..10).to_a.shuffle
      raise 'default seed is not set' if srand == 0
    end