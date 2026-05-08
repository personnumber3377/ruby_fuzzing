do
      10.times do
        x = ExIvar.new
        x.instance_variable_set(:@resize, 1)
        x
      end