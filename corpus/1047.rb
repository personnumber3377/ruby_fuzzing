downto(-16).to_a
    hash = {}
    values.each do |val|
      hash[klass.new(val)] = val
    end