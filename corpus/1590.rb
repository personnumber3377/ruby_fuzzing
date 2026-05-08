do
      count = 0
      array.sort! do |a, b|
        array.freeze if (count += 1) == 6
        frozen_array ||= array.map.to_a if array.frozen?
        b <=> a
      end