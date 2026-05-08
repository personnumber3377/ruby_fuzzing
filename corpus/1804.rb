do |i|
      n = (10**i).to_i
      root = Integer.sqrt(n)
      failures << n  unless root*root <= n && (root+1)*(root+1) > n
    end