do
      alias orig_foo foo
      attr_reader :b2

      def foo
        @b2 ||= 0
        raise SystemStackError if (@b2 += 1) > 1
        # "foo from B (again)"
        orig_foo + "B2"
      end