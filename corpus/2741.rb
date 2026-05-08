do
          methods.each do |method|
            define_method(method) do |*args, **kwargs, &block|
              super(*args, **kwargs, &block)
            end