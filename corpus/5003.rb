do
      retvals << define_singleton_method(:foo){}
      retvals << define_singleton_method(:bar, method(:foo))
    end