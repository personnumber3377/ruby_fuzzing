do
      include Enumerable
      def each(&b)
        @b = b
      end