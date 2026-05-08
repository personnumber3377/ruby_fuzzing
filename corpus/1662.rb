down
    Object.class_eval do
      remove_method :method_o rescue nil
    end