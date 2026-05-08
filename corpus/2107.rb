do
      [:m1, :m2].each do |m|
        define_method(m) do
          tap { return __method__ }
        end