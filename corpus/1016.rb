do
      x.transform_values!() do |v|
        x.freeze if v == 2
        v.succ
      end