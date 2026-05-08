do
          remove_method :foo
          define_method :foo, original_foo
        end