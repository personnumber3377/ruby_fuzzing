do
      alias orig_foo foo

      def foo
        # "foo from C"
        orig_foo + "C"
      end