do |x|
      raise "too big" if x > 10000
      (x**2) % 10
    end