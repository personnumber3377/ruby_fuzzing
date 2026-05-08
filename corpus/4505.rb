do |iv|
        instance_variable_set(iv, data.instance_variable_get(iv))
      end