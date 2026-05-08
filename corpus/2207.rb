do
      define_method(:x1){order << :x1; self}
      define_method(:y1){order << :y1; self}
      define_method(:x2){order << :x2; self}
      define_method(:x3){order << :x3; self}
      define_method(:x4){order << :x4; self}
      define_method(:[]){|*args| order << [:[], *args]; self}
      define_method(:r1){order << :r1; :r1}
      define_method(:r2){order << :r2; :r2}

      define_method(:constant_values) do
        h = {}
        constants.each do |sym|
          h[sym] = const_get(sym)
        end