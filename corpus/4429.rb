do
      1.instance_eval { method_missing(:method_missing) }
    end