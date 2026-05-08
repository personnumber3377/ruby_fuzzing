do
      bar.instance_method(:foo).bind(b.new)
    end