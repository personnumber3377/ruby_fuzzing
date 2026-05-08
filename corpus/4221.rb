do |a|
      [ints, floats].each do |values|
        values.combination(2).to_a.product(values).each do |(from, to), search|
          check_bsearch_values(from..to, search, a)
          check_bsearch_values(from...to, search, a)
        end