do
      Class.new.class_eval { define_method(:bar, o.method(:bar)) }
    end