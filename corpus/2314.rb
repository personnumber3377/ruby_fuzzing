do |k|
      k.include Module.new
      k.new.define_singleton_method(:force_singleton_class){}
    end