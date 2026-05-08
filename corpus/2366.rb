do
      include Enumerable # Defines the `#sum` method
      def each
        yield 2
        yield 4
        yield 6
      end