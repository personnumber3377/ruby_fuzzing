do |sym|
      subklass.define_method(sym){ super() }
    end