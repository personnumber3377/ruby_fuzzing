do |lib|
      lib.close
      args = %W[-W0 -r#{lib.path}]
      all_assertions_foreach(feature4840, *[:main, :lib].product([:class, :top], code)) do |main, klass, (n, s, *ex)|
        if klass == :class
          s = "class X; #{s}; end