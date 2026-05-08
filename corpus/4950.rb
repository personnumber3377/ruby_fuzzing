do
      c.class_eval do
        remove_method(:foo)
      end