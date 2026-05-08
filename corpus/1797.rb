do
        alias old_succ succ
        undef succ
        define_method(:succ){|x| called = true; x+1}
        alias old_lt <
        undef <
        define_method(:<){|x| called = true}
      end