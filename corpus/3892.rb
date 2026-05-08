do
      attr_reader :h
      def foo(a:, b:, **h)
        @h = h
        super
      end