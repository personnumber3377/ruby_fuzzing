do
      Module.instance_method(:module_function).bind(c).call(:foo)
    end