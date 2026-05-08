do
      [:m1, :m2].each do |m|
        define_method(m) do
          __method__
        end