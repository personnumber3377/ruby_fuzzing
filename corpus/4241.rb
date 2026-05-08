do |hash|
      hash.each { |k, v| stat_heap_sum[k] += v }
    end