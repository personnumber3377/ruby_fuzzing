do
      include a
      attr_reader :b

      def foo
        @b ||= 0
        raise SystemStackError if (@b += 1) > 1
        # "foo from B"
        super + "B"
      end