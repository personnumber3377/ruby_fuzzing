do |obj|
      1000.times do |i|
        obj.instance_variable_set("@var#{i}", i)
      end