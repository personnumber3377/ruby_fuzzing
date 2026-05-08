do
        def refined_call_foo = foo
        def refined_call_foo_on(other) = other.foo

        protected

        def foo = :foo
      end