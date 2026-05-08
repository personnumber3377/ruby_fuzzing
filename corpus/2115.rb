do
      Class.new.class_eval { define_method(:foo, o.method(:foo)) }
    end