do
      Class.new.class_eval { define_method(:foo, Object.new) }
    end