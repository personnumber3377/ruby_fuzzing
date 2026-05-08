do
      Class.new do
        define_method('foo', String.instance_method(:to_s))
      end