do
      retvals << define_method(:foo){}
      retvals << define_method(:bar, instance_method(:foo))
    end