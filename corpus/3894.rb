do
      attr_reader :h
      def foo(**h)
        @h = h
        super
      end