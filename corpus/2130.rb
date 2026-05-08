do
      Class.new do
        define_method('foo', &Object.instance_method(:to_s))
      end