do |i|
        i.inspect
        ObjectSpace.each_object(Array) do |a|
          a.clear if a.length == size
        end