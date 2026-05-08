do
      include Enumerable
      def each
        yield 1
        yield 2
        yield 3
      end