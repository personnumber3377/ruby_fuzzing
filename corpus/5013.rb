do
      cls = Class.new(String) do
        define_method('foo', String.instance_method(:to_s))
      end